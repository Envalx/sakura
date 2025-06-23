<?php

namespace Sakura\User\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\User\Models\Admin::class,
        \Sakura\User\Models\Role::class,
    ];
}
