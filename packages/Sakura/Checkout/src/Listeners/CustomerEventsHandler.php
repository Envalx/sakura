<?php

namespace Sakura\Checkout\Listeners;

use Cart;

class CustomerEventsHandler
{
    /**
     * Handle Customer login events.
     */
    public function onCustomerLogin($customer)
    {
        /**
         * handle the user login event to manage the after login, if the user has added any products as guest then
         * the cart items from session will be transferred from cookie to the cart table in the database.
         *
         * Check whether cookie is present or not and then check emptiness and then do the appropriate actions.
         */
        Cart::mergeCart($customer);
    }

    /**
     * Register the listeners for the subscriber.
     *
     * @param  \Illuminate\Events\Dispatcher  $events
     * @return void
     */
    public function subscribe($events)
    {
        $events->listen('customer.after.login', 'Sakura\Checkout\Listeners\CustomerEventsHandler@onCustomerLogin');
    }
}
