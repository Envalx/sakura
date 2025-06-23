<?php

return [

    'convention' => Sakura\Core\CoreConvention::class,

    'modules' => [

        /**
         * Example:
         * VendorA\ModuleX\Providers\ModuleServiceProvider::class,
         * VendorB\ModuleY\Providers\ModuleServiceProvider::class
         */
        \Sakura\Admin\Providers\ModuleServiceProvider::class,
        \Sakura\Attribute\Providers\ModuleServiceProvider::class,
        // \Sakura\CartRule\Providers\ModuleServiceProvider::class,
        // \Sakura\CatalogRule\Providers\ModuleServiceProvider::class,
        \Sakura\Category\Providers\ModuleServiceProvider::class,
        \Sakura\Checkout\Providers\ModuleServiceProvider::class,
        \Sakura\Core\Providers\ModuleServiceProvider::class,
        \Sakura\CMS\Providers\ModuleServiceProvider::class,
        \Sakura\Customer\Providers\ModuleServiceProvider::class,
        \Sakura\DataGrid\Providers\ModuleServiceProvider::class,
        // \Sakura\DataTransfer\Providers\ModuleServiceProvider::class,
        \Sakura\Inventory\Providers\ModuleServiceProvider::class,
        \Sakura\Marketing\Providers\ModuleServiceProvider::class,
        \Sakura\Notification\Providers\ModuleServiceProvider::class,
        \Sakura\Payment\Providers\ModuleServiceProvider::class,
        // \Sakura\Paypal\Providers\ModuleServiceProvider::class,
        \Sakura\Product\Providers\ModuleServiceProvider::class,
        \Sakura\Rule\Providers\ModuleServiceProvider::class,
        \Sakura\Sales\Providers\ModuleServiceProvider::class,
        \Sakura\Shipping\Providers\ModuleServiceProvider::class,
        \Sakura\Shop\Providers\ModuleServiceProvider::class,
        // \Sakura\SocialLogin\Providers\ModuleServiceProvider::class,
        \Sakura\Tax\Providers\ModuleServiceProvider::class,
        \Sakura\Theme\Providers\ModuleServiceProvider::class,
        \Sakura\User\Providers\ModuleServiceProvider::class,
        // \Sakura\Sitemap\Providers\ModuleServiceProvider::class,
    ],
];
