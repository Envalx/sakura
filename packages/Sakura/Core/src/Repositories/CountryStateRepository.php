<?php

namespace Sakura\Core\Repositories;

use Sakura\Core\Eloquent\Repository;

class CountryStateRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Core\Contracts\CountryState';
    }
}
