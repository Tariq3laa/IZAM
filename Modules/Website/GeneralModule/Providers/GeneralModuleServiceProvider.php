<?php

namespace Modules\Website\GeneralModule\Providers;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Modules\Website\GeneralModule\Repositories\ProductRepository;
use Modules\Website\GeneralModule\Repositories\ProductRepositoryInterface;

class GeneralModuleServiceProvider extends ServiceProvider
{

    protected $moduleNamespace = 'Modules\Website\GeneralModule\Http\Controllers';
    protected $webRoute = 'Modules/Website/GeneralModule/Routes/web.php';
    protected $apiRoute = 'Modules/Website/GeneralModule/Routes/api.php';

    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerViews();
        $this->registerRoutes();
        $this->registerApiRoutes();
        $this->registerMigrations();
    }


    protected function registerRoutes()
    {
        Route::middleware('web')
            ->namespace($this->moduleNamespace)
            ->group(base_path($this->webRoute));
    }

    protected function registerApiRoutes()
    {
        Route::prefix('api')
            ->middleware('api')
            ->namespace($this->moduleNamespace)
            ->group(base_path($this->apiRoute));
    }

    /**
     * Register module migrations.
     */
    protected function registerMigrations()
    {
        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
    }

    public function register()
    {
        $this->app->bind(ProductRepositoryInterface::class, ProductRepository::class);
    }

    protected function registerViews()
    {
        $this->loadViewsFrom(__DIR__.'/../Resources/views', 'website');
    }
}
