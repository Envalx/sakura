<?php

namespace Sakura\Checkout\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\Checkout\Models\CartAddress;

class CartAddressFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var \Sakura\Checkout\Models\CartAddress
     */
    protected $model = CartAddress::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [
            'address'          => implode(PHP_EOL, [$this->faker->address()]),
            'company_name'     => $this->faker->company(),
            'first_name'       => preg_replace('/[^a-zA-Z ]/', '', $this->faker->firstName()),
            'last_name'        => preg_replace('/[^a-zA-Z ]/', '', $this->faker->lastName()),
            'email'            => $this->faker->safeEmail(),
            'country'          => $this->faker->countryCode(),
            'state'            => $this->faker->randomElement(['Delhi', 'Mumbai', 'Kolkata', 'Rajasthan']),
            'city'             => $this->faker->city(),
            'postcode'         => $this->faker->numerify('######'),
            'phone'            => $this->faker->e164PhoneNumber(),
            'address_type'     => CartAddress::ADDRESS_TYPE_BILLING,
        ];
    }
}
