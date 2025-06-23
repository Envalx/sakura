<?php

namespace Sakura\Marketing\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Marketing\Models\Campaign::class,
        \Sakura\Marketing\Models\Event::class,
        \Sakura\Marketing\Models\SearchSynonym::class,
        \Sakura\Marketing\Models\SearchTerm::class,
        \Sakura\Marketing\Models\Template::class,
        \Sakura\Marketing\Models\URLRewrite::class,
    ];
}
