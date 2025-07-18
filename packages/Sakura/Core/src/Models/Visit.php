<?php

namespace Sakura\Core\Models;

use Shetabit\Visitor\Models\Visit as BaseVisit;
use Sakura\Core\Contracts\Visit as VisitContract;

class Visit extends BaseVisit implements VisitContract
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'method',
        'request',
        'url',
        'referer',
        'languages',
        'useragent',
        'headers',
        'device',
        'platform',
        'browser',
        'ip',
        'visitor_id',
        'visitor_type',
        'channel_id',
    ];
}
