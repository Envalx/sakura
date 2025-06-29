<?php

namespace Sakura\Shop\Http\Controllers;

use Illuminate\Http\Request;
use Sakura\Category\Repositories\CategoryRepository;
use Sakura\Product\Repositories\ProductRepository;
use Sakura\Theme\Repositories\ThemeCustomizationRepository;

class ProductsCategoriesProxyController extends Controller
{
    /**
     * Using const variable for status
     *
     * @var int Status
     */
    const STATUS = 1;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        protected CategoryRepository $categoryRepository,
        protected ProductRepository $productRepository,
        protected ThemeCustomizationRepository $themeCustomizationRepository
    ) {}

    /**
     * Show product or category view. If neither category nor product matches, abort with code 404.
     *
     * @return \Illuminate\View\View|\Exception
     */
    public function index(Request $request)
    {
        $slugOrURLKey = urldecode(trim($request->getPathInfo(), '/'));

        /**
         * Support url for chinese, japanese, arabic and english with numbers.
         */
        if (! preg_match('/^([\p{L}\p{N}\p{M}\x{0900}-\x{097F}\x{0590}-\x{05FF}\x{0600}-\x{06FF}\x{0400}-\x{04FF}_-]+\/?)+$/u', $slugOrURLKey)) {
            visitor()->visit();

            $customizations = $this->themeCustomizationRepository->orderBy('sort_order')->findWhere([
                'status'     => self::STATUS,
                'channel_id' => core()->getCurrentChannel()->id,
            ]);

            return view('shop::home.index', compact('customizations'));
        }

        $category = $this->categoryRepository->findBySlug($slugOrURLKey);

        if ($category) {
            visitor()->visit($category);

            return view('shop::categories.view', [
                'category' => $category,
                'params'   => [
                    'sort'  => request()->query('sort'),
                    'limit' => request()->query('limit'),
                    'mode'  => request()->query('mode'),
                ],
            ]);
        }

        $product = $this->productRepository->findBySlug($slugOrURLKey);

        if ($product) {
            if (
                ! $product->url_key
                || ! $product->visible_individually
                || ! $product->status
            ) {
                abort(404);
            }

            visitor()->visit($product);

            return view('shop::products.view', compact('product'));
        }

        /**
         * If category is not found, try to find it by slug.
         * If category is found by slug, redirect to category path.
         */
        $trimmedSlug = last(explode('/', $slugOrURLKey));

        $category = $this->categoryRepository->findBySlug($trimmedSlug);

        if ($category) {
            return redirect()->to($trimmedSlug, 301);
        }

        abort(404);
    }
}
