<?php

namespace Sakura\Sales\Repositories;

use Illuminate\Container\Container;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;
use Sakura\Core\Eloquent\Repository;
use Sakura\Sales\Generators\InvoiceSequencer;

class InvoiceRepository extends Repository
{
    /**
     * Create a new repository instance.
     *
     * @return void
     */
    public function __construct(
        protected OrderRepository $orderRepository,
        protected OrderItemRepository $orderItemRepository,
        protected InvoiceItemRepository $invoiceItemRepository,
        protected DownloadableLinkPurchasedRepository $downloadableLinkPurchasedRepository,
        Container $container
    ) {
        parent::__construct($container);
    }

    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Sales\Contracts\Invoice';
    }

    /**
     * Create invoice.
     *
     * @param  string  $invoiceState
     * @param  string  $orderState
     * @return \Sakura\Sales\Models\Invoice
     */
    public function create(array $data, $invoiceState = null, $orderState = null)
    {
        DB::beginTransaction();

        try {
            Event::dispatch('sales.invoice.save.before', $data);

            $order = $this->orderRepository->find($data['order_id']);

            $totalQty = array_sum($data['invoice']['items']);

            if (isset($invoiceState)) {
                $state = $invoiceState;
            } else {
                $state = 'paid';
            }

            $invoice = $this->model->create([
                'increment_id'          => $this->generateIncrementId(),
                'order_id'              => $order->id,
                'total_qty'             => $totalQty,
                'state'                 => $state,
                'base_currency_code'    => $order->base_currency_code,
                'channel_currency_code' => $order->channel_currency_code,
                'order_currency_code'   => $order->order_currency_code,
                'order_address_id'      => $order->billing_address->id,
            ]);

            foreach ($data['invoice']['items'] as $itemId => $qty) {
                if (! $qty) {
                    continue;
                }

                $orderItem = $this->orderItemRepository->find($itemId);

                if ($qty > $orderItem->qty_to_invoice) {
                    $qty = $orderItem->qty_to_invoice;
                }

                $taxAmount = (($orderItem->tax_amount / $orderItem->qty_ordered) * $qty);

                $baseTaxAmount = (($orderItem->base_tax_amount / $orderItem->qty_ordered) * $qty);

                $invoiceItem = $this->invoiceItemRepository->create([
                    'invoice_id'           => $invoice->id,
                    'order_item_id'        => $orderItem->id,
                    'name'                 => $orderItem->name,
                    'sku'                  => $orderItem->sku,
                    'qty'                  => $qty,
                    'price'                => $orderItem->price,
                    'price_incl_tax'       => $orderItem->price + $taxAmount,
                    'base_price'           => $orderItem->base_price,
                    'base_price_incl_tax'  => $orderItem->base_price + $baseTaxAmount,
                    'total_incl_tax'       => ($orderItem->price * $qty) + $taxAmount,
                    'total'                => $orderItem->price * $qty,
                    'base_total'           => $orderItem->base_price * $qty,
                    'base_total_incl_tax'  => ($orderItem->base_price * $qty) + $baseTaxAmount,
                    'tax_amount'           => $taxAmount,
                    'base_tax_amount'      => $baseTaxAmount,
                    'discount_amount'      => (($orderItem->discount_amount / $orderItem->qty_ordered) * $qty),
                    'base_discount_amount' => (($orderItem->base_discount_amount / $orderItem->qty_ordered) * $qty),
                    'product_id'           => $orderItem->product_id,
                    'product_type'         => $orderItem->product_type,
                    'additional'           => $orderItem->additional,
                ]);

                if ($orderItem->getTypeInstance()->isComposite()) {
                    foreach ($orderItem->children as $childOrderItem) {
                        $finalQty = $childOrderItem->qty_ordered
                            ? ($childOrderItem->qty_ordered / $orderItem->qty_ordered) * $qty
                            : $orderItem->qty_ordered;

                        $this->invoiceItemRepository->create([
                            'invoice_id'           => $invoice->id,
                            'order_item_id'        => $childOrderItem->id,
                            'parent_id'            => $invoiceItem->id,
                            'name'                 => $childOrderItem->name,
                            'sku'                  => $childOrderItem->sku,
                            'qty'                  => $finalQty,
                            'price'                => $childOrderItem->price,
                            'base_price'           => $childOrderItem->base_price,
                            'total'                => $childOrderItem->price * $finalQty,
                            'base_total'           => $childOrderItem->base_price * $finalQty,
                            'tax_amount'           => 0,
                            'base_tax_amount'      => 0,
                            'discount_amount'      => 0,
                            'base_discount_amount' => 0,
                            'product_id'           => $childOrderItem->product_id,
                            'product_type'         => $childOrderItem->product_type,
                            'additional'           => $childOrderItem->additional,
                        ]);

                        if (
                            $childOrderItem->product
                            && ! $childOrderItem->getTypeInstance()->isStockable()
                            && $childOrderItem->getTypeInstance()->showQuantityBox()
                        ) {
                            $this->invoiceItemRepository->updateProductInventory([
                                'invoice'   => $invoice,
                                'product'   => $childOrderItem->product,
                                'qty'       => $finalQty,
                                'vendor_id' => $data['vendor_id'] ?? 0,
                            ]);
                        }

                        $this->orderItemRepository->collectTotals($childOrderItem);
                    }
                } elseif (
                    $orderItem->product
                    && ! $orderItem->getTypeInstance()->isStockable()
                    && $orderItem->getTypeInstance()->showQuantityBox()
                ) {
                    $this->invoiceItemRepository->updateProductInventory([
                        'invoice'   => $invoice,
                        'product'   => $orderItem->product,
                        'qty'       => $qty,
                        'vendor_id' => $data['vendor_id'] ?? 0,
                    ]);
                }

                $this->orderItemRepository->collectTotals($orderItem);

                $this->downloadableLinkPurchasedRepository->updateStatus($orderItem, 'available');
            }

            $this->collectTotals($invoice);

            $this->orderRepository->collectTotals($order);

            if (isset($orderState)) {
                $this->orderRepository->updateOrderStatus($order, $orderState);
            } else {
                $this->orderRepository->updateOrderStatus($order);
            }

            /**
             * Temporary property has been used to avoid request helper usage in listener.
             */
            $invoice->can_create_transaction = request()->has('can_create_transaction') && request()->input('can_create_transaction') == '1';

            Event::dispatch('sales.invoice.save.after', $invoice);
        } catch (\Exception $e) {
            DB::rollBack();

            throw $e;
        }

        DB::commit();

        return $invoice;
    }

    /**
     * Have product to invoice.
     */
    public function haveProductToInvoice(array $data): bool
    {
        foreach ($data['invoice']['items'] as $qty) {
            if ((int) $qty) {
                return true;
            }
        }

        return false;
    }

    /**
     * Is valid quantity.
     */
    public function isValidQuantity(array $data): bool
    {
        foreach ($data['invoice']['items'] as $itemId => $qty) {
            $orderItem = $this->orderItemRepository->find($itemId);

            if ($qty > $orderItem->qty_to_invoice) {
                return false;
            }
        }

        return true;
    }

    /**
     * Generate increment id.
     *
     * @return int
     */
    public function generateIncrementId()
    {
        return app(InvoiceSequencer::class)->resolveGeneratorClass();
    }

    /**
     * Collect totals.
     *
     * @param  \Sakura\Sales\Models\Invoice  $invoice
     * @return \Sakura\Sales\Models\Invoice
     */
    public function collectTotals($invoice)
    {
        $invoice->sub_total = $invoice->base_sub_total = 0;
        $invoice->sub_total_incl_tax = $invoice->base_sub_total_incl_tax = 0;
        $invoice->tax_amount = $invoice->base_tax_amount = 0;
        $invoice->shipping_tax_amount = $invoice->shipping_tax_amount = 0;
        $invoice->discount_amount = $invoice->base_discount_amount = 0;

        foreach ($invoice->items as $item) {
            $invoice->tax_amount += $item->tax_amount;
            $invoice->base_tax_amount += $item->base_tax_amount;

            $invoice->discount_amount += $item->discount_amount;
            $invoice->base_discount_amount += $item->base_discount_amount;

            $invoice->sub_total += $item->total;
            $invoice->base_sub_total += $item->base_total;

            $invoice->sub_total_incl_tax = (float) $invoice->sub_total_incl_tax + $item->total_incl_tax;
            $invoice->base_sub_total_incl_tax = (float) $invoice->base_sub_total_incl_tax + $item->base_total_incl_tax;
        }

        $invoice->shipping_amount = $invoice->order->shipping_amount;
        $invoice->shipping_amount_incl_tax = $invoice->order->shipping_amount_incl_tax;

        $invoice->base_shipping_amount = $invoice->order->base_shipping_amount;
        $invoice->base_shipping_amount_incl_tax = $invoice->order->base_shipping_amount_incl_tax;

        $invoice->discount_amount += $invoice->order->shipping_discount_amount;
        $invoice->base_discount_amount += $invoice->order->base_shipping_discount_amount;

        if ($invoice->order->shipping_tax_amount) {
            $invoice->shipping_tax_amount = $invoice->order->shipping_tax_amount;

            $invoice->base_shipping_tax_amount = $invoice->order->base_shipping_tax_amount;

            $invoice->tax_amount += $invoice->order->shipping_tax_amount;

            $invoice->base_tax_amount += $invoice->order->base_shipping_tax_amount;

            foreach ($invoice->order->invoices as $prevInvoice) {
                if ((float) $prevInvoice->shipping_tax_amount) {
                    $invoice->shipping_tax_amount = $invoice->base_shipping_tax_amount = 0;

                    $invoice->tax_amount -= $invoice->order->shipping_tax_amount;

                    $invoice->base_tax_amount -= $invoice->order->base_shipping_tax_amount;
                }
            }
        }

        if ($invoice->order->shipping_amount) {
            foreach ($invoice->order->invoices as $prevInvoice) {
                if ((float) $prevInvoice->shipping_amount) {
                    $invoice->shipping_amount = $invoice->base_shipping_amount = 0;
                    $invoice->shipping_amount_incl_tax = $invoice->base_shipping_amount_incl_tax = 0;
                }

                if ($prevInvoice->id != $invoice->id) {
                    $invoice->discount_amount -= $invoice->order->shipping_discount_amount;
                    $invoice->base_discount_amount -= $invoice->order->base_shipping_discount_amount;
                }
            }
        }

        $invoice->grand_total = $invoice->sub_total + $invoice->tax_amount + $invoice->shipping_amount - $invoice->discount_amount;
        $invoice->base_grand_total = $invoice->base_sub_total + $invoice->base_tax_amount + $invoice->base_shipping_amount - $invoice->base_discount_amount;

        $invoice->save();

        return $invoice;
    }

    /**
     * Update state.
     *
     * @param  \Sakura\Sales\Models\Invoice  $invoice
     * @return bool
     */
    public function updateState($invoice, $status)
    {
        $invoice->state = $status;
        $invoice->save();

        return true;
    }

    /**
     * Get total amount of pending invoices.
     */
    public function getTotalPendingInvoicesAmount(): float
    {
        return $this->where('state', 'pending')->sum('grand_total');
    }
}
