<?php

namespace Sakura\Customer\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Customer\Models\Customer::class,
        \Sakura\Customer\Models\CustomerAddress::class,
        \Sakura\Customer\Models\CustomerGroup::class,
        \Sakura\Customer\Models\Wishlist::class,
        \Sakura\Customer\Models\CompareItem::class,
        \Sakura\Customer\Models\CustomerNote::class,
    ];
}
