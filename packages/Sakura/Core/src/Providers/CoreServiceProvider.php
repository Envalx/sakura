<?php

namespace Sakura\Core\Providers;

use Elastic\Elasticsearch\Client as ElasticSearchClient;
use Illuminate\Contracts\Debug\ExceptionHandler;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;
use Sakura\Core\Acl;
use Sakura\Core\Core;
use Sakura\Core\ElasticSearch;
use Sakura\Core\Exceptions\Handler;
use Sakura\Core\Facades\Acl as AclFacade;
use Sakura\Core\Facades\Core as CoreFacade;
use Sakura\Core\Facades\ElasticSearch as ElasticSearchFacade;
use Sakura\Core\Facades\Menu as MenuFacade;
use Sakura\Core\Facades\SystemConfig as SystemConfigFacade;
use Sakura\Core\Menu;
use Sakura\Core\SystemConfig;
use Sakura\Core\View\Compilers\BladeCompiler;
use Sakura\Theme\ViewRenderEventManager;

class CoreServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        include __DIR__.'/../Http/helpers.php';

        $this->loadMigrationsFrom(__DIR__.'/../Database/Migrations');

        $this->loadTranslationsFrom(__DIR__.'/../Resources/lang', 'core');

        $this->publishes([
            dirname(__DIR__).'/Config/concord.php'       => config_path('concord.php'),
            dirname(__DIR__).'/Config/repository.php'    => config_path('repository.php'),
            dirname(__DIR__).'/Config/visitor.php'       => config_path('visitor.php'),
            dirname(__DIR__).'/Config/elasticsearch.php' => config_path('elasticsearch.php'),
        ]);

        $this->app->register(EventServiceProvider::class);

        $this->app->register(VisitorServiceProvider::class);

        $this->app->bind(ExceptionHandler::class, Handler::class);

        $this->loadViewsFrom(__DIR__.'/../Resources/views', 'core');

        Event::listen('application.shop.layout.body.after', static function (ViewRenderEventManager $viewRenderEventManager) {
            $viewRenderEventManager->addTemplate('core::blade.tracer.style');
        });

        Event::listen('application.admin.layout.head', static function (ViewRenderEventManager $viewRenderEventManager) {
            $viewRenderEventManager->addTemplate('core::blade.tracer.style');
        });

        $this->app->extend('command.down', function () {
            return new \Sakura\Core\Console\Commands\DownCommand;
        });

        $this->app->extend('command.up', function () {
            return new \Sakura\Core\Console\Commands\UpCommand;
        });

        /**
         * Image Cache route
         */
        if (is_string(config('imagecache.route'))) {
            $filenamePattern = '[ \w\\.\\/\\-\\@\(\)\=]+';

            /**
             * Route to access template applied image file
             */
            $this->app['router']->get(config('imagecache.route').'/{template}/{filename}', [
                'uses' => 'Sakura\Core\ImageCache\Controller@getResponse',
                'as'   => 'imagecache',
            ])->where(['filename' => $filenamePattern]);
        }
    }

    /**
     * Register services.
     */
    public function register(): void
    {
        $this->registerFacades();

        $this->registerCommands();

        $this->registerBladeCompiler();
    }

    /**
     * Register Bouncer as a singleton.
     */
    protected function registerFacades(): void
    {
        $loader = AliasLoader::getInstance();

        $loader->alias('core', CoreFacade::class);

        $loader->alias('menu', MenuFacade::class);

        $loader->alias('acl', AclFacade::class);

        $loader->alias('system_config', SystemConfigFacade::class);

        $this->app->singleton('core', function () {
            return app()->make(Core::class);
        });

        $this->app->singleton('menu', function () {
            return app()->make(Menu::class);
        });

        $this->app->singleton('acl', function () {
            return app()->make(Acl::class);
        });

        $this->app->singleton('system_config', function () {
            return app()->make(SystemConfig::class);
        });

        /**
         * Register ElasticSearch as a singleton.
         */
        $this->app->singleton('elasticsearch', function () {
            return new ElasticSearch;
        });

        $loader->alias('elasticsearch', ElasticSearchFacade::class);

        $this->app->singleton(ElasticSearchClient::class, function () {
            return app()->make('elasticsearch')->connection();
        });
    }

    /**
     * Register the console commands of this package.
     */
    protected function registerCommands(): void
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                \Sakura\Core\Console\Commands\ApplicationPublish::class,
                \Sakura\Core\Console\Commands\ApplicationVersion::class,
                \Sakura\Core\Console\Commands\ExchangeRateUpdate::class,
                \Sakura\Core\Console\Commands\InvoiceOverdueCron::class,
            ]);
        }

        $this->commands([
            \Sakura\Core\Console\Commands\DownChannelCommand::class,
            \Sakura\Core\Console\Commands\UpChannelCommand::class,
        ]);
    }

    /**
     * Register the Blade compiler implementation.
     */
    public function registerBladeCompiler(): void
    {
        $this->app->singleton('blade.compiler', function ($app) {
            return new BladeCompiler($app['files'], $app['config']['view.compiled']);
        });
    }
}
