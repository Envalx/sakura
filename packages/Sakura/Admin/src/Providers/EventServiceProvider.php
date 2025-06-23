<?php

namespace Sakura\Admin\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event handler mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'customer.registration.after' => [
            'Sakura\Admin\Listeners\Customer@afterCreated',
        ],

        'admin.password.update.after' => [
            'Sakura\Admin\Listeners\Admin@afterPasswordUpdated',
        ],

        'checkout.order.save.after' => [
            'Sakura\Admin\Listeners\Order@afterCreated',
        ],

        'sales.order.cancel.after' => [
            'Sakura\Admin\Listeners\Order@afterCanceled',
        ],

        'sales.invoice.save.after' => [
            'Sakura\Admin\Listeners\Invoice@afterCreated',
        ],

        'sales.shipment.save.after' => [
            'Sakura\Admin\Listeners\Shipment@afterCreated',
        ],

        'sales.refund.save.after' => [
            'Sakura\Admin\Listeners\Refund@afterCreated',
        ],

        'core.channel.update.after' => [
            'Sakura\Admin\Listeners\ChannelSettingsChange@checkForMaintenanceMode',
        ],
    ];
}
