<?php

namespace Sakura\Customer\Repositories;

use Sakura\Core\Eloquent\Repository;
use Sakura\Customer\Contracts\Wishlist;

class WishlistRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return Wishlist::class;
    }
}
