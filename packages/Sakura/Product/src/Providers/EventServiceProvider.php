<?php

namespace Sakura\Product\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event handler mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'catalog.product.create.after'  => [
            'Sakura\Product\Listeners\Product@afterCreate',
        ],
        'catalog.product.update.after'  => [
            'Sakura\Product\Listeners\Product@afterUpdate',
        ],
        'catalog.product.delete.before' => [
            'Sakura\Product\Listeners\Product@beforeDelete',
        ],
        'checkout.order.save.after'     => [
            'Sakura\Product\Listeners\Order@afterCancelOrCreate',
        ],
        'sales.order.cancel.after'      => [
            'Sakura\Product\Listeners\Order@afterCancelOrCreate',
        ],
        'sales.refund.save.after'       => [
            'Sakura\Product\Listeners\Refund@afterCreate',
        ],
    ];
}
