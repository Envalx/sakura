<?php

namespace Sakura\Marketing\Repositories;

use Sakura\Core\Eloquent\Repository;

class CampaignRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Marketing\Contracts\Campaign';
    }
}
