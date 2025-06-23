<?php

namespace Sakura\Attribute\Repositories;

use Sakura\Core\Eloquent\Repository;

class AttributeGroupRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Attribute\Contracts\AttributeGroup';
    }
}
