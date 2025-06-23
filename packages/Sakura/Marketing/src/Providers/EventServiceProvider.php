<?php

namespace Sakura\Marketing\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event handler mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        /**
         * Product Events
         */
        'catalog.product.update.before'  => [
            'Sakura\Marketing\Listeners\Product@beforeUpdate',
        ],

        'catalog.product.delete.before' => [
            'Sakura\Marketing\Listeners\Product@beforeDelete',
        ],

        /**
         * Category Events
         */
        'catalog.category.create.after' => [
            'Sakura\Marketing\Listeners\Category@afterCreate',
        ],

        'catalog.category.update.before' => [
            'Sakura\Marketing\Listeners\Category@beforeUpdate',
        ],

        'catalog.category.delete.before' => [
            'Sakura\Marketing\Listeners\Category@beforeDelete',
        ],

        /**
         * CMS Page Events
         */
        'cms.page.create.after' => [
            'Sakura\Marketing\Listeners\Page@afterCreate',
        ],

        'cms.page.update.before' => [
            'Sakura\Marketing\Listeners\Page@beforeUpdate',
        ],

        'cms.page.delete.before' => [
            'Sakura\Marketing\Listeners\Page@beforeDelete',
        ],
    ];
}
