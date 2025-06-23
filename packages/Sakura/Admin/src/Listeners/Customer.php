<?php

namespace Sakura\Admin\Listeners;

use Illuminate\Support\Facades\Mail;
use Sakura\Admin\Mail\Customer\RegistrationNotification;

class Customer extends Base
{
    /**
     * After customer is created
     *
     * @param  \Sakura\Customer\Contracts\Customer  $customer
     * @return void
     */
    public function afterCreated($customer)
    {
        try {
            if (! core()->getConfigData('emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin')) {
                return;
            }

            Mail::queue(new RegistrationNotification($customer));
        } catch (\Exception $e) {
            report($e);
        }
    }
}
