<?php

return [
    'defaults' => [
        'guard'     => 'customer',
        'passwords' => 'customers',
    ],

    'guards' => [
        'customer' => [
            'driver'   => 'session',
            'provider' => 'customers',
        ],

        'admin' => [
            'driver'   => 'session',
            'provider' => 'admins',
        ],
    ],

    'providers' => [
        'customers' => [
            'driver' => 'eloquent',
            'model'  => Sakura\Customer\Models\Customer::class,
        ],

        'admins' => [
            'driver' => 'eloquent',
            'model'  => Sakura\User\Models\Admin::class,
        ],
    ],

    'passwords' => [
        'customers' => [
            'provider' => 'customers',
            'table'    => 'customer_password_resets',
            'expire'   => 60,
            'throttle' => 60,
        ],

        'admins' => [
            'provider' => 'admins',
            'table'    => 'admin_password_resets',
            'expire'   => 60,
            'throttle' => 60,
        ],
    ],
];
