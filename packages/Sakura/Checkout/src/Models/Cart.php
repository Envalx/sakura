<?php

namespace Sakura\Checkout\Models;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Sakura\Checkout\Contracts\Cart as CartContract;
use Sakura\Checkout\Database\Factories\CartFactory;
use Sakura\Core\Models\ChannelProxy;
use Sakura\Customer\Models\CustomerProxy;

class Cart extends Model implements CartContract
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart';

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [
        'id',
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'additional' => 'json',
    ];

    /**
     * Get the customer record associated with the address.
     */
    public function customer(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(CustomerProxy::modelClass());
    }

    /**
     * Get the channel record associated with the address.
     */
    public function channel(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(ChannelProxy::modelClass());
    }

    /**
     * To get relevant associated items with the cart instance.
     */
    public function items(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CartItemProxy::modelClass())
            ->whereNull('parent_id');
    }

    /**
     * To get all the associated items with the cart instance even the parent and child items of configurable products.
     */
    public function all_items(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CartItemProxy::modelClass());
    }

    /**
     * Get the billing address for the cart.
     */
    public function billing_address(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(CartAddressProxy::modelClass())->where('address_type', CartAddress::ADDRESS_TYPE_BILLING);
    }

    /**
     * Get the shipping address for the cart.
     */
    public function shipping_address(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(CartAddressProxy::modelClass())->where('address_type', CartAddress::ADDRESS_TYPE_SHIPPING);
    }

    /**
     * Get the shipping rates for the cart.
     */
    public function shipping_rates(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CartShippingRateProxy::modelClass());
    }

    /**
     * Get all the attributes for the attribute groups.
     */
    public function selected_shipping_rate()
    {
        return $this->shipping_rates
            ->where('method', $this->shipping_method);
    }

    /**
     * Get all the attributes for the attribute groups.
     */
    public function getSelectedShippingRateAttribute()
    {
        return $this->selected_shipping_rate()
            ->first();
    }

    /**
     * Get the payment associated with the cart.
     */
    public function payment(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(CartPaymentProxy::modelClass());
    }

    /**
     * Checks if cart have stockable items.
     */
    public function haveStockableItems(): bool
    {
        foreach ($this->items as $item) {
            if ($item->product->isStockable()) {
                return true;
            }
        }

        return false;
    }

    /**
     * Checks if cart has downloadable items.
     */
    public function hasDownloadableItems(): bool
    {
        return $this->items->pluck('type')->contains('downloadable');
    }

    /**
     * Returns true if cart contains one or many products with quantity box.
     *
     * (For Example: simple, configurable, virtual)
     */
    public function hasProductsWithQuantityBox(): bool
    {
        foreach ($this->items as $item) {
            if ($item->getTypeInstance()->showQuantityBox()) {
                return true;
            }
        }

        return false;
    }

    /**
     * Checks if cart has items that allow guest checkout.
     */
    public function hasGuestCheckoutItems(): bool
    {
        foreach ($this->items as $item) {
            if (! $item->product->getAttribute('guest_checkout')) {
                return false;
            }
        }

        return true;
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory(): Factory
    {
        return CartFactory::new();
    }
}
