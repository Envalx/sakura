<?php

namespace Sakura\Tax\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Tax\Models\TaxCategory::class,
        \Sakura\Tax\Models\TaxMap::class,
        \Sakura\Tax\Models\TaxRate::class,
    ];
}
