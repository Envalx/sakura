<?php

namespace Sakura\FPC\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event handler mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'catalog.product.update.after'  => [
            'Sakura\FPC\Listeners\Product@afterUpdate',
        ],

        'catalog.product.delete.before' => [
            'Sakura\FPC\Listeners\Product@beforeDelete',
        ],

        'catalog.category.update.after' => [
            'Sakura\FPC\Listeners\Category@afterUpdate',
        ],

        'catalog.category.delete.before' => [
            'Sakura\FPC\Listeners\Category@beforeDelete',
        ],

        'customer.review.update.after' => [
            'Sakura\FPC\Listeners\Review@afterUpdate',
        ],

        'customer.review.delete.before' => [
            'Sakura\FPC\Listeners\Review@beforeDelete',
        ],

        'checkout.order.save.after'     => [
            'Sakura\FPC\Listeners\Order@afterCancelOrCreate',
        ],

        'sales.order.cancel.after'      => [
            'Sakura\FPC\Listeners\Order@afterCancelOrCreate',
        ],

        'sales.refund.save.after'       => [
            'Sakura\FPC\Listeners\Refund@afterCreate',
        ],

        'cms.page.update.after' => [
            'Sakura\FPC\Listeners\Page@afterUpdate',
        ],

        'cms.page.delete.before' => [
            'Sakura\FPC\Listeners\Page@beforeDelete',
        ],

        'theme_customization.create.after' => [
            'Sakura\FPC\Listeners\ThemeCustomization@afterCreate',
        ],

        'theme_customization.update.after' => [
            'Sakura\FPC\Listeners\ThemeCustomization@afterUpdate',
        ],

        'theme_customization.delete.before' => [
            'Sakura\FPC\Listeners\ThemeCustomization@beforeDelete',
        ],

        'core.channel.update.after' => [
            'Sakura\FPC\Listeners\Channel@afterUpdate',
        ],

        'marketing.search_seo.url_rewrites.update.after' => [
            'Sakura\FPC\Listeners\URLRewrite@afterUpdate',
        ],

        'marketing.search_seo.url_rewrites.delete.before' => [
            'Sakura\FPC\Listeners\URLRewrite@beforeDelete',
        ],
    ];
}
