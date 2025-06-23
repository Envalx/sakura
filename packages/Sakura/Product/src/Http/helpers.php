<?php

use Sakura\Product\Helpers\Toolbar;
use Sakura\Product\ProductImage;

if (! function_exists('product_image')) {
    /**
     * Product image helper.
     */
    function product_image(): ProductImage
    {
        return app()->make(ProductImage::class);
    }
}

if (! function_exists('product_toolbar')) {
    /**
     * Product tolbar helper.
     */
    function product_toolbar(): Toolbar
    {
        return app()->make(Toolbar::class);
    }
}
