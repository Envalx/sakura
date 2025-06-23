<?php

namespace Sakura\Admin\Http\Controllers\Catalog\Product;

use Illuminate\Http\JsonResponse;
use Sakura\Admin\Http\Controllers\Controller;
use Sakura\Product\Helpers\ConfigurableOption;
use Sakura\Product\Repositories\ProductRepository;

class ConfigurableController extends Controller
{
    /**
     * Create a new controller instance.
     */
    public function __construct(
        protected ProductRepository $productRepository,
        protected ConfigurableOption $configurableOptionHelper
    ) {}

    /**
     * Returns the compare items of the customer.
     */
    public function options(int $id): JsonResponse
    {
        $product = $this->productRepository->findOrFail($id);

        return new JsonResponse([
            'data' => $this->configurableOptionHelper->getConfigurationConfig($product),
        ]);
    }
}
