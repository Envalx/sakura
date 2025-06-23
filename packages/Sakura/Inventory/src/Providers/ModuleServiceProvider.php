<?php

namespace Sakura\Inventory\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Inventory\Models\InventorySource::class,
    ];
}
