<?php

namespace Sakura\Sales\Models;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Sakura\Sales\Contracts\OrderPayment as OrderPaymentContract;
use Sakura\Sales\Database\Factories\OrderPaymentFactory;

class OrderPayment extends Model implements OrderPaymentContract
{
    use HasFactory;

    protected $table = 'order_payment';

    protected $guarded = [
        'id',
        'created_at',
        'updated_at',
    ];

    protected $casts = [
        'additional' => 'array',
    ];

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory(): Factory
    {
        return OrderPaymentFactory::new();
    }
}
