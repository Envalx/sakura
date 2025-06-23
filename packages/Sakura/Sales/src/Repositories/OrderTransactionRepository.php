<?php

namespace Sakura\Sales\Repositories;

use Sakura\Core\Eloquent\Repository;
use Sakura\Sales\Contracts\OrderTransaction;

class OrderTransactionRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return OrderTransaction::class;
    }
}
