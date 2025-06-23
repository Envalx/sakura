<?php

namespace Sakura\Product\Providers;

use Sakura\Core\Providers\CoreModuleServiceProvider;

class ModuleServiceProvider extends CoreModuleServiceProvider
{
    protected $models = [
        \Sakura\Product\Models\Product::class,
        \Sakura\Product\Models\ProductAttributeValue::class,
        \Sakura\Product\Models\ProductFlat::class,
        \Sakura\Product\Models\ProductGroupedProduct::class,
        \Sakura\Product\Models\ProductImage::class,
        \Sakura\Product\Models\ProductInventory::class,
        \Sakura\Product\Models\ProductInventoryIndex::class,
        \Sakura\Product\Models\ProductOrderedInventory::class,
        \Sakura\Product\Models\ProductPriceIndex::class,
        \Sakura\Product\Models\ProductReview::class,
        \Sakura\Product\Models\ProductReviewAttachment::class,
        \Sakura\Product\Models\ProductSalableInventory::class,
    ];
}
