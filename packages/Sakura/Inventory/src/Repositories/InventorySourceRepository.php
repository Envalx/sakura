<?php

namespace Sakura\Inventory\Repositories;

use Sakura\Core\Eloquent\Repository;

class InventorySourceRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Inventory\Contracts\InventorySource';
    }
}
