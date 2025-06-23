<?php

namespace Sakura\Category\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Category\Models\Category::class,
        \Sakura\Category\Models\CategoryTranslation::class,
    ];
}
