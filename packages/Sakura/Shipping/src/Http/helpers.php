<?php

use Sakura\Shipping\Shipping;

if (! function_exists('shipping')) {
    function shipping()
    {
        return new Shipping;
    }
}
