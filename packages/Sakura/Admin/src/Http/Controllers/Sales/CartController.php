<?php

namespace Sakura\Admin\Http\Controllers\Sales;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Response;
use Sakura\Admin\Http\Controllers\Controller;
use Sakura\Admin\Http\Requests\CartAddressRequest;
use Sakura\Admin\Http\Resources\CartResource;
use Sakura\Checkout\Facades\Cart;
use Sakura\Checkout\Repositories\CartRepository;
use Sakura\Customer\Repositories\CustomerRepository;
use Sakura\Payment\Facades\Payment;
use Sakura\Product\Repositories\ProductRepository;
use Sakura\Shipping\Facades\Shipping;

class CartController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        protected CartRepository $cartRepository,
        protected CustomerRepository $customerRepository,
        protected ProductRepository $productRepository
    ) {}

    /**
     * Cart.
     */
    public function index(int $id): JsonResource
    {
        $cart = $this->cartRepository->findOrFail($id);

        $response = [
            'data' => new CartResource($cart),
        ];

        if (session()->has('info')) {
            $response['message'] = session()->get('info');
        }

        return new JsonResource($response);
    }

    /**
     * Create cart
     */
    public function store(): JsonResource
    {
        $customer = $this->customerRepository->findOrFail(request()->input('customer_id'));

        try {
            $cart = Cart::createCart([
                'customer'  => $customer,
                'is_active' => false,
            ]);

            return new JsonResource([
                'data'         => new CartResource($cart),
                'redirect_url' => route('admin.sales.orders.create', $cart->id),
            ]);
        } catch (\Exception $exception) {
            return new JsonResource([
                'message' => $exception->getMessage(),
            ]);
        }
    }

    /**
     * Store items in cart.
     */
    public function storeItem(int $cartId): JsonResource
    {
        $this->validate(request(), [
            'product_id' => 'required|integer|exists:products,id',
        ]);

        $cart = $this->cartRepository->findOrFail($cartId);

        Cart::setCart($cart);

        try {
            $params = request()->all();

            $product = $this->productRepository->findOrFail($params['product_id']);

            Cart::addProduct($product, $params);

            return new JsonResource([
                'data'    => new CartResource(Cart::getCart()),
                'message' => trans('admin::app.sales.orders.create.cart.success-add-to-cart'),
            ]);
        } catch (\Exception $exception) {
            return new JsonResource([
                'message' => $exception->getMessage(),
            ]);
        }
    }

    /**
     * Removes the item from the cart if it exists.
     */
    public function destroyItem(int $cartId): JsonResource
    {
        $this->validate(request(), [
            'cart_item_id' => 'required|exists:cart_items,id',
        ]);

        $cart = $this->cartRepository->findOrFail($cartId);

        Cart::setCart($cart);

        Cart::removeItem(request()->input('cart_item_id'));

        Cart::collectTotals();

        return new JsonResource([
            'data'    => new CartResource(Cart::getCart()),
            'message' => trans('admin::app.sales.orders.create.cart.success-remove'),
        ]);
    }

    /**
     * Updates the quantity of the items present in the cart.
     */
    public function updateItem(int $cartId): JsonResource
    {
        $cart = $this->cartRepository->findOrFail($cartId);

        Cart::setCart($cart);

        try {
            Cart::updateItems(request()->input());

            return new JsonResource([
                'data'    => new CartResource(Cart::getCart()),
                'message' => trans('admin::app.sales.orders.create.cart.success-update'),
            ]);
        } catch (\Exception $exception) {
            return new JsonResource([
                'message' => $exception->getMessage(),
            ]);
        }
    }

    /**
     * Store address.
     */
    public function storeAddress(CartAddressRequest $cartAddressRequest, int $id): JsonResource|JsonResponse
    {
        $cart = $this->cartRepository->findOrFail($id);

        $params = $cartAddressRequest->all();

        Cart::setCart($cart);

        if (Cart::hasError()) {
            return new JsonResponse([
                'message' => implode(': ', Cart::getErrors()) ?: 'Something went wrong',
            ], Response::HTTP_BAD_REQUEST);
        }

        Cart::saveAddresses($params);

        Cart::collectTotals();

        if ($cart->haveStockableItems()) {
            if (! $rates = Shipping::collectRates()) {
                return new JsonResource([
                    'redirect'     => true,
                    'redirect_url' => route('shop.checkout.cart.index'),
                ]);
            }

            return new JsonResource([
                'redirect' => false,
                'data'     => $rates,
            ]);
        }

        return new JsonResource([
            'redirect' => false,
            'data'     => Payment::getSupportedPaymentMethods(),
        ]);
    }

    /**
     * Store shipping method.
     *
     * @return \Illuminate\Http\Response
     */
    public function storeShippingMethod(int $id)
    {
        $validatedData = $this->validate(request(), [
            'shipping_method' => 'required',
        ]);

        $cart = $this->cartRepository->findOrFail($id);

        Cart::setCart($cart);

        if (
            Cart::hasError()
            || ! $validatedData['shipping_method']
            || ! Cart::saveShippingMethod($validatedData['shipping_method'])
        ) {
            return response()->json([
                'redirect_url' => route('shop.checkout.cart.index'),
            ], Response::HTTP_FORBIDDEN);
        }

        Cart::collectTotals();

        return response()->json(Payment::getSupportedPaymentMethods());
    }

    /**
     * Store payment method.
     *
     * @return array
     */
    public function storePaymentMethod(int $id)
    {
        $validatedData = $this->validate(request(), [
            'payment' => 'required',
        ]);

        $cart = $this->cartRepository->findOrFail($id);

        Cart::setCart($cart);

        if (
            Cart::hasError()
            || ! $validatedData['payment']
            || ! Cart::savePaymentMethod($validatedData['payment'])
        ) {
            return response()->json([
                'redirect_url' => route('shop.checkout.cart.index'),
            ], Response::HTTP_FORBIDDEN);
        }

        Cart::collectTotals();

        $cart = Cart::getCart();

        return [
            'cart' => new CartResource($cart),
        ];
    }
}
