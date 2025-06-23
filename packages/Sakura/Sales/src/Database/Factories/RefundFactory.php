<?php

namespace Sakura\Sales\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\Sales\Models\Refund;

class RefundFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Refund::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [];
    }
}
