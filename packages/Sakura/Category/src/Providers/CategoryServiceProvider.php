<?php

namespace Sakura\Category\Providers;

use Illuminate\Support\ServiceProvider;
use Sakura\Category\Models\CategoryProxy;
use Sakura\Category\Observers\CategoryObserver;

class CategoryServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        $this->loadMigrationsFrom(__DIR__.'/../Database/Migrations');

        CategoryProxy::observe(CategoryObserver::class);
    }
}
