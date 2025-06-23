<?php

if (! function_exists('cart')) {
    /**
     * Cart helper.
     *
     * @return \Sakura\Checkout\Cart
     */
    function cart()
    {
        return app()->make('cart');
    }
}
