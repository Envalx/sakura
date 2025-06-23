<?php

namespace Sakura\Product\Repositories;

use Sakura\Core\Eloquent\Repository;

class ProductPriceIndexRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Product\Contracts\ProductPriceIndex';
    }
}
