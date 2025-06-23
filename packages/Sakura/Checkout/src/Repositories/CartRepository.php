<?php

namespace Sakura\Checkout\Repositories;

use Sakura\Core\Eloquent\Repository;

class CartRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Checkout\Contracts\Cart';
    }
}
