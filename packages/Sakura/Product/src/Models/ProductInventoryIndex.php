<?php

namespace Sakura\Product\Models;

use Illuminate\Database\Eloquent\Model;
use Sakura\Core\Models\ChannelProxy;
use Sakura\Product\Contracts\ProductInventoryIndex as ProductInventoryIndexContract;

class ProductInventoryIndex extends Model implements ProductInventoryIndexContract
{
    /**
     * Fillable.
     *
     * @var array
     */
    protected $fillable = [
        'qty',
        'product_id',
        'channel_id',
    ];

    /**
     * Get the product that owns the inventory index.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(ProductProxy::modelClass());
    }

    /**
     * Get the channel owns the inventory index.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function channel()
    {
        return $this->belongsTo(ChannelProxy::modelClass());
    }
}
