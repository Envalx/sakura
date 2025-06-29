<?php

namespace Sakura\Inventory\Models;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Sakura\Inventory\Contracts\InventorySource as InventorySourceContract;
use Sakura\Inventory\Database\Factories\InventorySourceFactory;

class InventorySource extends Model implements InventorySourceContract
{
    use HasFactory;

    protected $guarded = ['_token'];

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory(): Factory
    {
        return InventorySourceFactory::new();
    }
}
