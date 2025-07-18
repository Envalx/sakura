<?php

namespace Sakura\Product;

use Illuminate\Support\Facades\Storage;
use League\Flysystem\Local\LocalFilesystemAdapter;
use Sakura\Customer\Contracts\Wishlist;
use Sakura\Product\Repositories\ProductRepository;

class ProductImage
{
    /**
     * Create a new helper instance.
     *
     * @return void
     */
    public function __construct(protected ProductRepository $productRepository) {}

    /**
     * Retrieve collection of gallery images.
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    public function getGalleryImages($product)
    {
        if (! $product) {
            return [];
        }

        $images = [];

        foreach ($product->images as $image) {
            if (! Storage::has($image->path)) {
                continue;
            }

            $images[] = $this->getCachedImageUrls($image->path);
        }

        if (
            ! $product->parent_id
            && ! count($images)
            && ! count([])
        ) {
            $images[] = $this->getFallbackImageUrls();
        }

        /*
         * Product parent checked already above. If the case reached here that means the
         * parent is available. So recursing the method for getting the parent image if
         * images of the child are not found.
         */
        if (empty($images)) {
            $images = $this->getGalleryImages($product->parent);
        }

        return $images;
    }

    /**
     * Get product variant image if available otherwise product base image.
     *
     * @param  \Sakura\Customer\Contracts\Wishlist  $item
     * @return array
     */
    public function getProductImage($item)
    {
        if ($item instanceof Wishlist) {
            if (isset($item->additional['selected_configurable_option'])) {
                $product = $this->productRepository->find($item->additional['selected_configurable_option']);
            } else {
                $product = $item->product;
            }
        } else {
            $product = $item->product;
        }

        return $this->getProductBaseImage($product);
    }

    /**
     * This method will first check whether the gallery images are already
     * present or not. If not then it will load from the product.
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @param  array
     * @return array
     */
    public function getProductBaseImage($product, ?array $galleryImages = null)
    {
        if (! $product) {
            return;
        }

        return $galleryImages
            ? $galleryImages[0]
            : $this->otherwiseLoadFromProduct($product);
    }

    /**
     * Load product's base image.
     *
     * @param  \Sakura\Product\Contracts\Product  $product
     * @return array
     */
    protected function otherwiseLoadFromProduct($product)
    {
        $images = $product?->images;

        return $images && $images->count()
            ? $this->getCachedImageUrls($images[0]->path)
            : $this->getFallbackImageUrls();
    }

    /**
     * Get cached urls configured for intervention package.
     *
     * @param  string  $path
     */
    private function getCachedImageUrls($path): array
    {
        if (! $this->isDriverLocal()) {
            return [
                'small_image_url'    => Storage::url($path),
                'medium_image_url'   => Storage::url($path),
                'large_image_url'    => Storage::url($path),
                'original_image_url' => Storage::url($path),
            ];
        }

        return [
            'small_image_url'    => url('cache/small/'.$path),
            'medium_image_url'   => url('cache/medium/'.$path),
            'large_image_url'    => url('cache/large/'.$path),
            'original_image_url' => url('cache/original/'.$path),
        ];
    }

    /**
     * Get fallback urls.
     */
    private function getFallbackImageUrls(): array
    {
        $smallImageUrl = core()->getConfigData('catalog.products.cache_small_image.url')
                        ? Storage::url(core()->getConfigData('catalog.products.cache_small_image.url'))
                        : application_asset('images/small-product-placeholder.webp', 'shop');

        $mediumImageUrl = core()->getConfigData('catalog.products.cache_medium_image.url')
                        ? Storage::url(core()->getConfigData('catalog.products.cache_medium_image.url'))
                        : application_asset('images/medium-product-placeholder.webp', 'shop');

        $largeImageUrl = core()->getConfigData('catalog.products.cache_large_image.url')
                        ? Storage::url(core()->getConfigData('catalog.products.cache_large_image.url'))
                        : application_asset('images/large-product-placeholder.webp', 'shop');

        return [
            'small_image_url'    => $smallImageUrl,
            'medium_image_url'   => $mediumImageUrl,
            'large_image_url'    => $largeImageUrl,
            'original_image_url' => application_asset('images/large-product-placeholder.webp', 'shop'),
        ];
    }

    /**
     * Is driver local.
     */
    private function isDriverLocal(): bool
    {
        return Storage::getAdapter() instanceof LocalFilesystemAdapter;
    }
}
