<?php

namespace Sakura\Customer\Repositories;

use Sakura\Core\Eloquent\Repository;

class CustomerNoteRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Customer\Contracts\CustomerNote';
    }
}
