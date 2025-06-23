<?php

namespace Sakura\Product\Helpers\Indexers\Price;

use Sakura\Customer\Repositories\CustomerRepository;

abstract class AbstractType
{
    /**
     * Product instance.
     *
     * @var \Sakura\Product\Contracts\Product
     */
    protected $product;

    /**
     * Channel instance.
     *
     * @var \Sakura\Core\Contracts\Channel
     */
    protected $channel;

    /**
     * Customer Group instance.
     *
     * @var \Sakura\Customer\Contracts\CustomerGroup
     */
    protected $customerGroup;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(
        protected CustomerRepository $customerRepository,
    ) {}

    /**
     * Set current product
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return \Sakura\Product\Helpers\Indexers\Price\AbstractPriceIndex
     */
    public function setProduct($product)
    {
        $this->product = $product;

        return $this;
    }

    /**
     * Set channel
     *
     * @param  \Sakura\Core\Contracts\Channel  $channel
     * @return \Sakura\Product\Helpers\Indexers\Price\AbstractPriceIndex
     */
    public function setChannel($channel)
    {
        $this->channel = $channel;

        return $this;
    }

    /**
     * Set customer group
     *
     * @param  \Sakura\Customer\Contracts\CustomerGroup  $customerGroup
     * @return \Sakura\Product\Helpers\Indexers\Price\AbstractPriceIndex
     */
    public function setCustomerGroup($customerGroup)
    {
        $this->customerGroup = $customerGroup;

        return $this;
    }

    /**
     * Returns product specific pricing for customer group
     *
     * @return array
     */
    public function getIndices()
    {
        return [
            'min_price'         => ($minPrice = $this->getMinimalPrice()) ?? 0,
            'regular_min_price' => $this->product->price ?? 0,
            'max_price'         => $minPrice ?? 0,
            'regular_max_price' => $this->product->price ?? 0,
            'product_id'        => $this->product->id,
            'channel_id'        => $this->channel->id,
            'customer_group_id' => $this->customerGroup->id,
        ];
    }

    /**
     * Get product minimal price.
     *
     * @param  int  $qty
     * @return float
     */
    public function getMinimalPrice($qty = null)
    {
        $customerGroupPrice = $this->getCustomerGroupPrice($qty ?? 1);

        $rulePrice = $this->getCatalogRulePrice();

        if (
            empty($this->product->special_price)
            && empty($rulePrice)
            && $customerGroupPrice == $this->product->price
        ) {
            return $this->product->price;
        }

        if (! (float) $this->product->special_price) {
            if ($rulePrice) {
                $discountedPrice = min($rulePrice->price, $this->product->price);
            } else {
                $discountedPrice = $this->product->price;
            }
        } else {
            if ($rulePrice) {
                if (
                    core()->isChannelDateInInterval(
                        $this->product->special_price_from,
                        $this->product->special_price_to
                    )
                ) {
                    $discountedPrice = min($rulePrice->price, $this->product->special_price);
                } else {
                    $discountedPrice = $rulePrice->price;
                }
            } else {
                if (
                    core()->isChannelDateInInterval(
                        $this->product->special_price_from,
                        $this->product->special_price_to
                    )
                ) {
                    $discountedPrice = $this->product->special_price;
                } else {
                    $discountedPrice = $this->product->price;
                }
            }
        }

        return min($discountedPrice, $customerGroupPrice);
    }

    /**
     * Get product group price.
     *
     * @param  int  $qty
     * @return float
     */
    public function getCustomerGroupPrice($qty)
    {
        return $this->product->price;
    }

    /**
     * Get catalog rules product price for specific date, channel and customer group.
     *
     * @return mixed
     */
    public function getCatalogRulePrice()
    {
        return [];
    }
}
