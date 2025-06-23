<?php

namespace Sakura\User\Repositories;

use Sakura\Core\Eloquent\Repository;

class RoleRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\User\Contracts\Role';
    }
}
