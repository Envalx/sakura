<?php

namespace Sakura\Marketing\Models;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Sakura\Marketing\Contracts\Template as TemplateContract;
use Sakura\Marketing\Database\Factories\TemplateFactory;

class Template extends Model implements TemplateContract
{
    use HasFactory;

    /**
     * Define the table name for the Model
     *
     * @var string
     */
    protected $table = 'marketing_templates';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'status',
        'content',
    ];

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory(): Factory
    {
        return TemplateFactory::new();
    }
}
