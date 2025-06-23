<?php

namespace Sakura\Admin\Listeners;

use Illuminate\Support\Facades\Mail;

class Admin
{
    /**
     * Send mail on updating password.
     *
     * @param  \Sakura\User\Models\Admin  $admin
     * @return void
     */
    public function afterPasswordUpdated($admin) {}
}
