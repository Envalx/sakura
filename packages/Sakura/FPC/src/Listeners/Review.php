<?php

namespace Sakura\FPC\Listeners;

use Spatie\ResponseCache\Facades\ResponseCache;
use Sakura\Product\Repositories\ProductReviewRepository;

class Review
{
    /**
     * Create a new listener instance.
     *
     * @return void
     */
    public function __construct(protected ProductReviewRepository $productReviewRepository) {}

    /**
     * After review is updated
     *
     * @param  \Sakura\Product\Contracts\Review  $review
     * @return void
     */
    public function afterUpdate($review)
    {
        ResponseCache::forget('/'.$review->product->url_key);
    }

    /**
     * Before review is deleted
     *
     * @param  \Sakura\Product\Contracts\Review  $review
     * @return void
     */
    public function beforeDelete($reviewId)
    {
        $review = $this->productReviewRepository->find($reviewId);

        ResponseCache::forget('/'.$review->product->url_key);
    }
}
