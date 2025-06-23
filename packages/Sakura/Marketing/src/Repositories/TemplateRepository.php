<?php

namespace Sakura\Marketing\Repositories;

use Sakura\Core\Eloquent\Repository;

class TemplateRepository extends Repository
{
    /**
     * Specify model class name.
     */
    public function model(): string
    {
        return 'Sakura\Marketing\Contracts\Template';
    }
}
