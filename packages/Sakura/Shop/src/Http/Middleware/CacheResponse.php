<?php

namespace Sakura\Shop\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Spatie\ResponseCache\Middlewares\CacheResponse as BaseCacheResponseMiddleware;
use Spatie\ResponseCache\ResponseCache as BaseResponseCache;
use Symfony\Component\HttpFoundation\Response;
use Sakura\Marketing\Repositories\SearchTermRepository;
use Sakura\Marketing\Repositories\URLRewriteRepository;

class CacheResponse extends BaseCacheResponseMiddleware
{
    /**
     * Create a middleware instance.
     *
     * @return void
     */
    public function __construct(protected BaseResponseCache $responseCache)
    {
        $this->responseCache = $responseCache;

        parent::__construct($responseCache);
    }

    /**
     * Handle an incoming request.
     *
     * @param  mixed  ...$args
     * @return mixed
     */
    public function handle(Request $request, Closure $next, ...$args): Response
    {
        if (! $this->responseCache->enabled($request)) {
            return parent::handle($request, $next, ...$args);
        }

        /**
         * Redirect to the search term redirect url if the search term is found.
         */
        if ($request->route()->getName() == 'shop.search.index') {
            $searchTerm = app(SearchTermRepository::class)->findOneWhere([
                'term'       => request()->query('query'),
                'channel_id' => core()->getCurrentChannel()->id,
                'locale'     => app()->getLocale(),
            ]);

            if ($searchTerm?->redirect_url) {
                return redirect()->to($searchTerm->redirect_url);
            }
        }

        /**
         * Redirect to the target path if the url rewrite is found.
         */
        if ($request->route()->getName() == 'shop.product_or_category.index') {
            $slugOrPath = urldecode(trim($request->getPathInfo(), '/'));
        }

        /**
         * Redirect to the target path if the cms page url rewrite is found.
         */
        if ($request->route()->getName() == 'shop.cms.page') {
            $slug = last(explode('/', $request->getPathInfo()));

            $pageURLRewrite = app(URLRewriteRepository::class)->findOneWhere([
                'entity_type'  => 'cms_page',
                'request_path' => $slug,
                'locale'       => app()->getLocale(),
            ]);

            if ($pageURLRewrite) {
                return redirect()->to($pageURLRewrite->target_path, $pageURLRewrite->redirect_type);
            }
        }

        return parent::handle($request, $next, ...$args);
    }
}
