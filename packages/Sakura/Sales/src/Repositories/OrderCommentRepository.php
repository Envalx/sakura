<?php

namespace Sakura\Sales\Repositories;

use Sakura\Core\Eloquent\Repository;

class OrderCommentRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Sales\Contracts\OrderComment';
    }
}
