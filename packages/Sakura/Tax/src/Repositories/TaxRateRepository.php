<?php

namespace Sakura\Tax\Repositories;

use Sakura\Core\Eloquent\Repository;

class TaxRateRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Tax\Contracts\TaxRate';
    }
}
