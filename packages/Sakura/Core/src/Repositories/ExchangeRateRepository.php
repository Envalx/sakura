<?php

namespace Sakura\Core\Repositories;

use Sakura\Core\Eloquent\Repository;

class ExchangeRateRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Core\Contracts\CurrencyExchangeRate';
    }
}
