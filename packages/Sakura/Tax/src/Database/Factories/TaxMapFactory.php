<?php

namespace Sakura\Tax\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\Tax\Models\TaxMap;

class TaxMapFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TaxMap::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [];
    }
}
