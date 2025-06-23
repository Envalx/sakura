<?php

namespace Sakura\Attribute\Models;

use Illuminate\Database\Eloquent\Model;
use Sakura\Attribute\Contracts\AttributeOptionTranslation as AttributeOptionTranslationContract;

class AttributeOptionTranslation extends Model implements AttributeOptionTranslationContract
{
    public $timestamps = false;

    protected $fillable = ['label'];
}
