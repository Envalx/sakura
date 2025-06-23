<?php

namespace Sakura\Customer\Repositories;

use Sakura\Core\Eloquent\Repository;
use Sakura\Customer\Contracts\CompareItem;

class CompareItemRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return CompareItem::class;
    }
}
