<?php

namespace Sakura\Attribute\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Attribute\Models\Attribute::class,
        \Sakura\Attribute\Models\AttributeFamily::class,
        \Sakura\Attribute\Models\AttributeGroup::class,
        \Sakura\Attribute\Models\AttributeOption::class,
        \Sakura\Attribute\Models\AttributeOptionTranslation::class,
        \Sakura\Attribute\Models\AttributeTranslation::class,
    ];
}
