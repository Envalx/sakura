<?php

use Sakura\Theme\ViewRenderEventManager;

if (! function_exists('themes')) {
    /**
     * Themes.
     *
     * @return \Sakura\Theme\Themes
     */
    function themes()
    {
        return app()->make('themes');
    }
}

if (! function_exists('application_asset')) {
    /**
     * application asset.
     *
     * @return string
     */
    function application_asset(string $path, ?string $namespace = null)
    {
        return themes()->url($path, $namespace);
    }
}

if (! function_exists('view_render_event')) {
    /**
     * View render event.
     *
     * @param  string  $eventName
     * @param  mixed  $params
     * @return mixed
     */
    function view_render_event($eventName, $params = null)
    {
        app()->singleton(ViewRenderEventManager::class);

        $viewEventManager = app()->make(ViewRenderEventManager::class);

        $viewEventManager->handleRenderEvent($eventName, $params);

        return $viewEventManager->render();
    }
}
