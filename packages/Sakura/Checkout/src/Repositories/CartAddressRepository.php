<?php

namespace Sakura\Checkout\Repositories;

use Sakura\Core\Eloquent\Repository;

class CartAddressRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Checkout\Contracts\CartAddress';
    }
}
