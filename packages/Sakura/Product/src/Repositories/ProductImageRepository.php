<?php

namespace Sakura\Product\Repositories;

class ProductImageRepository extends ProductMediaRepository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Product\Contracts\ProductImage';
    }
}
