<?php

namespace Sakura\Product\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\Product\Models\ProductAttributeValue;

class ProductAttributeValueFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ProductAttributeValue::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [];
    }
}
