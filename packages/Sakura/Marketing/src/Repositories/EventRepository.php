<?php

namespace Sakura\Marketing\Repositories;

use Sakura\Core\Eloquent\Repository;

class EventRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Marketing\Contracts\Event';
    }
}
