<?php

namespace Sakura\Product\Repositories;

class ProductVideoRepository extends ProductMediaRepository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Product\Contracts\ProductVideo';
    }
}
