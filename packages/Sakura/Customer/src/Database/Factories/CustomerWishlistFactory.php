<?php

namespace Sakura\Customer\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\Customer\Models\Wishlist;

class CustomerWishlistFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Wishlist::class;

    /**
     * Define the model's default state.
     *
     * @throws \Exception
     */
    public function definition(): array
    {
        return [];
    }
}
