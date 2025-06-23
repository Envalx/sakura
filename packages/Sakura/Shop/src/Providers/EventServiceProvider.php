<?php

namespace Sakura\Shop\Providers;

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
            'Sakura\Shop\Listeners\Customer@afterCreated',
        ],

        'customer.password.update.after' => [
            'Sakura\Shop\Listeners\Customer@afterPasswordUpdated',
        ],

        'customer.subscription.after' => [
            'Sakura\Shop\Listeners\Customer@afterSubscribed',
        ],

        'customer.note.create.after' => [
            'Sakura\Shop\Listeners\Customer@afterNoteCreated',
        ],

        'checkout.order.save.after' => [
            'Sakura\Shop\Listeners\Order@afterCreated',
        ],

        'sales.order.cancel.after' => [
            'Sakura\Shop\Listeners\Order@afterCanceled',
        ],

        'sales.order.comment.create.after' => [
            'Sakura\Shop\Listeners\Order@afterCommented',
        ],

        'sales.invoice.save.after' => [
            'Sakura\Shop\Listeners\Invoice@afterCreated',
        ],

        'sales.invoice.send_duplicate_email' => [
            'Sakura\Shop\Listeners\Invoice@afterCreated',
        ],

        'sales.shipment.save.after' => [
            'Sakura\Shop\Listeners\Shipment@afterCreated',
        ],

        'sales.refund.save.after' => [
            'Sakura\Shop\Listeners\Refund@afterCreated',
        ],
    ];
}
