<?php

namespace Sakura\FPC\Listeners;

use Spatie\ResponseCache\Facades\ResponseCache;
use Sakura\CMS\Repositories\PageRepository;

class Page
{
    /**
     * Create a new listener instance.
     *
     * @return void
     */
    public function __construct(protected PageRepository $pageRepository) {}

    /**
     * After page update
     *
     * @param  \Sakura\CMS\Contracts\Page  $page
     * @return void
     */
    public function afterUpdate($page)
    {
        ResponseCache::forget('/page/'.$page->url_key);
    }

    /**
     * Before page delete
     *
     * @param  int  $pageId
     * @return void
     */
    public function beforeDelete($pageId)
    {
        $page = $this->pageRepository->find($pageId);

        ResponseCache::forget('/page/'.$page->url_key);
    }
}
