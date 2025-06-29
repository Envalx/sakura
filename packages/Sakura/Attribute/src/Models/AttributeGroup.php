<?php

namespace Sakura\Attribute\Models;

use Illuminate\Database\Eloquent\Model;
use Sakura\Attribute\Contracts\AttributeGroup as AttributeGroupContract;

class AttributeGroup extends Model implements AttributeGroupContract
{
    public $timestamps = false;

    protected $fillable = [
        'code',
        'name',
        'column',
        'position',
        'is_user_defined',
    ];

    /**
     * Get the attributes that owns the attribute group.
     */
    public function custom_attributes()
    {
        return $this->belongsToMany(AttributeProxy::modelClass(), 'attribute_group_mappings')
            ->withPivot('position')
            ->orderBy('pivot_position', 'asc');
    }
}
