<?php

namespace Sakura\User\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Sakura\User\Models\Role;

class RoleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Role::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name'            => preg_replace('/[^a-zA-Z ]/', '', $this->faker->name()),
            'permission_type' => $this->faker->randomElement(['custom', 'all']),
        ];
    }
}
