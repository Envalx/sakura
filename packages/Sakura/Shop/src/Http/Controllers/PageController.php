<?php

namespace Sakura\Shop\Http\Controllers;

use Sakura\CMS\Repositories\PageRepository;

class PageController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        protected PageRepository $pageRepository
    ) {}

    /**
     * To extract the page content and load it in the respective view file
     *
     * @param  string  $urlKey
     * @return \Illuminate\View\View
     */
    public function view($urlKey)
    {
        $page = $this->pageRepository->findByUrlKey($urlKey);

        if (! $page) {
            return redirect()->route('shop.home.index');
        }

        return view('shop::cms.page')->with('page', $page);
    }
}
