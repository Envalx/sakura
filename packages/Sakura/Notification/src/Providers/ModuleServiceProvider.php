<?php

namespace Sakura\Notification\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Notification\Models\Notification::class,
    ];
}
