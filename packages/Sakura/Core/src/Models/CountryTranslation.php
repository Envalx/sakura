<?php

namespace Sakura\Core\Models;

use Illuminate\Database\Eloquent\Model;
use Sakura\Core\Contracts\CountryTranslation as CountryTranslationContract;

class CountryTranslation extends Model implements CountryTranslationContract
{
    public $timestamps = false;

    protected $fillable = ['name'];
}
