<?php

namespace Sakura\FPC\Listeners;

use Spatie\ResponseCache\Facades\ResponseCache;

class Order extends Product
{
    /**
     * After order is created
     *
     * @param  \Sakura\Sale\Contracts\Order  $order
     * @return void
     */
    public function afterCancelOrCreate($order)
    {
        foreach ($order->all_items as $item) {
            if (! $item->product) {
                continue;
            }

            $urls = $this->getForgettableUrls($item->product);

            ResponseCache::forget($urls);
        }
    }
}
