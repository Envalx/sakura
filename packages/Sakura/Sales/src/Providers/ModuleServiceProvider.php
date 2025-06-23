<?php

namespace Sakura\Sales\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Sales\Models\Order::class,
        \Sakura\Sales\Models\OrderItem::class,
        \Sakura\Sales\Models\DownloadableLinkPurchased::class,
        \Sakura\Sales\Models\OrderAddress::class,
        \Sakura\Sales\Models\OrderPayment::class,
        \Sakura\Sales\Models\OrderComment::class,
        \Sakura\Sales\Models\Invoice::class,
        \Sakura\Sales\Models\InvoiceItem::class,
        \Sakura\Sales\Models\Shipment::class,
        \Sakura\Sales\Models\ShipmentItem::class,
        \Sakura\Sales\Models\Refund::class,
        \Sakura\Sales\Models\RefundItem::class,
        \Sakura\Sales\Models\OrderTransaction::class,
    ];
}
