<?php

namespace Sakura\Product\Repositories;

use Sakura\Core\Eloquent\Repository;

class ProductReviewRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Product\Contracts\ProductReview';
    }

    /**
     * Retrieve review for customerId
     *
     * @return \Illuminate\Support\Collection
     */
    public function getCustomerReview()
    {
        $reviews = $this->model
            ->where(['customer_id' => auth()->guard('customer')->user()->id])
            ->with('product')
            ->paginate(5);

        return $reviews;
    }
}
