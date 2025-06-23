<?php

namespace Sakura\Tax\Repositories;

use Sakura\Core\Eloquent\Repository;

class TaxMapRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Tax\Contracts\TaxMap';
    }
}
