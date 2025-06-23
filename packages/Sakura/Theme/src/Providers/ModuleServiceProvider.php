<?php

namespace Sakura\Theme\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    /**
     * Define the models
     *
     * @var array
     */
    protected $models = [
        \Sakura\Theme\Models\ThemeCustomization::class,
        \Sakura\Theme\Models\ThemeCustomizationTranslation::class,
    ];
}
