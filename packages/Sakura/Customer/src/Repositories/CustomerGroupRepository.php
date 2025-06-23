<?php

namespace Sakura\Customer\Repositories;

use Sakura\Core\Eloquent\Repository;

class CustomerGroupRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Customer\Contracts\CustomerGroup';
    }
}
