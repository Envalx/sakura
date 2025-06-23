<?php

namespace Sakura\Sales\Repositories;

use Sakura\Core\Eloquent\Repository;

/**
 * Order Address Repository
 *
 * @author    Jitendra Singh <jitendra@Sakura.com>
 * @copyright 2018 Sakura Software Pvt Ltd (http://www.Sakura.com)
 */
class OrderAddressRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Sales\Contracts\OrderAddress';
    }
}
