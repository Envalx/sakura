<?php

namespace Sakura\Checkout\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Checkout\Models\Cart::class,
        \Sakura\Checkout\Models\CartAddress::class,
        \Sakura\Checkout\Models\CartItem::class,
        \Sakura\Checkout\Models\CartPayment::class,
        \Sakura\Checkout\Models\CartShippingRate::class,
    ];
}
