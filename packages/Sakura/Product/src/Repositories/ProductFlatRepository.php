<?php

namespace Sakura\Product\Repositories;

use Sakura\Core\Eloquent\Repository;

class ProductFlatRepository extends Repository
{
    /**
     * Specify model.
     */
    public function model(): string
    {
        return 'Sakura\Product\Contracts\ProductFlat';
    }
}
