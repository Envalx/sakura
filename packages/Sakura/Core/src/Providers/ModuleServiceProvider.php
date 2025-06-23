<?php

namespace Sakura\Core\Providers;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Core\Models\Channel::class,
        \Sakura\Core\Models\CoreConfig::class,
        \Sakura\Core\Models\Country::class,
        \Sakura\Core\Models\CountryTranslation::class,
        \Sakura\Core\Models\CountryState::class,
        \Sakura\Core\Models\CountryStateTranslation::class,
        \Sakura\Core\Models\Currency::class,
        \Sakura\Core\Models\CurrencyExchangeRate::class,
        \Sakura\Core\Models\Locale::class,
        \Sakura\Core\Models\SubscribersList::class,
        \Sakura\Core\Models\Visit::class,
    ];
}
