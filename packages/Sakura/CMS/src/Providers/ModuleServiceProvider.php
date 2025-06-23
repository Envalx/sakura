<?php

namespace Sakura\CMS\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\CMS\Models\Page::class,
        \Sakura\CMS\Models\PageTranslation::class,
    ];
}
