<?php

namespace Sakura\FPC\Listeners;

use Spatie\ResponseCache\Facades\ResponseCache;
use Sakura\Product\Repositories\ProductRepository;

class Product
{
    /**
     * Create a new listener instance.
     *
     * @return void
     */
    public function __construct(
        protected ProductRepository $productRepository,
    ) {}

    /**
     * Update or create product page cache
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return void
     */
    public function afterUpdate($product)
    {
        $urls = $this->getForgettableUrls($product);

        ResponseCache::forget($urls);
    }

    /**
     * Delete product page c
     *
     * @param  int  $productId
     * @return void
     */
    public function beforeDelete($productId)
    {
        $product = $this->productRepository->find($productId);

        $urls = $this->getForgettableUrls($product);

        ResponseCache::forget($urls);
    }

    /**
     * Returns product urls
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    public function getForgettableUrls($product)
    {
        $urls = [];

        $products = $this->getAllRelatedProducts($product);

        foreach ($products as $product) {
            $urls[] = '/'.$product->url_key;
        }

        return $urls;
    }

    /**
     * Returns parents bundle products associated with simple product
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    public function getAllRelatedProducts($product)
    {
        $products = [$product];

        if ($product->type == 'simple') {
            if ($product->parent_id) {
                $products[] = $product->parent;
            }

        } elseif ($product->type == 'configurable') {
            $products = [];

            /**
             * Fetching fresh variants.
             */
            foreach ($product->variants()->get() as $variant) {
                $products[] = $variant;
            }

            $products[] = $product;
        }

        return $products;
    }

    /**
     * Returns parents bundle products associated with simple product
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    public function getParentBundleProducts($product)
    {
        $products = [];

        return $products;
    }

    /**
     * Returns parents group products associated with simple product
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    public function getParentGroupProducts($product)
    {
        $products = [];

        return $products;
    }
}
