<?php

namespace Sakura\FPC\Listeners;

use Spatie\ResponseCache\Facades\ResponseCache;

class Channel
{
    /**
     * After category update
     *
     * @param  \Sakura\Category\Contracts\Category  $category
     * @return void
     */
    public function afterUpdate($category)
    {
        ResponseCache::clear();
    }
}
