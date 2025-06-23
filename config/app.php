<?php

use Illuminate\Support\Facades\Facade;
use Illuminate\Support\ServiceProvider;

return [
    /*
    |--------------------------------------------------------------------------
    | Application Name
    |--------------------------------------------------------------------------
    |
    | This value is the name of your application. This value is used when the
    | framework needs to place the application's name in a notification or
    | any other location as required by the application or its packages.
    |
    */

    'name' => env('APP_NAME', 'application'),

    /*
    |--------------------------------------------------------------------------
    | Application Environment
    |--------------------------------------------------------------------------
    |
    | This value determines the "environment" your application is currently
    | running in. This may determine how you prefer to configure various
    | services your application utilizes. Set this in your ".env" file.
    |
    */

    'env' => env('APP_ENV', 'production'),

    /*
    |--------------------------------------------------------------------------
    | Application Debug Mode
    |--------------------------------------------------------------------------
    |
    | When your application is in debug mode, detailed error messages with
    | stack traces will be shown on every error that occurs within your
    | application. If disabled, a simple generic error page is shown.
    |
    */

    'debug' => env('APP_DEBUG', false),

    /*
    |--------------------------------------------------------------------------
    | Debug Allowed IPs
    |--------------------------------------------------------------------------
    |
    | This value is used to allow the debug mode only for the specified IPs.
    | This is useful when you want to debug the application on the production
    | server without enabling it for everyone.
    */

    'debug_allowed_ips' => env('APP_DEBUG_ALLOWED_IPS', null),

    /*
    |--------------------------------------------------------------------------
    | Application URL
    |--------------------------------------------------------------------------
    |
    | This URL is used by the console to properly generate URLs when using
    | the Artisan command line tool. You should set this to the root of
    | your application so that it is used when running Artisan tasks.
    |
    */

    'url' => env('APP_URL', 'http://localhost'),

    /*
    |--------------------------------------------------------------------------
    | Application Admin URL
    |--------------------------------------------------------------------------
    |
    | This URL suffix is used to define the admin url for example
    | admin/ or backend/
    |
    */

    'admin_url' => env('APP_ADMIN_URL', 'admin'),

    /*
    |--------------------------------------------------------------------------
    | Application Timezone
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default timezone for your application, which
    | will be used by the PHP date and date-time functions. We have gone
    | ahead and set this to a sensible default for you out of the box.
    |
    */

    'timezone' => env('APP_TIMEZONE', 'Asia/Kolkata'),

    /*
    |--------------------------------------------------------------------------
    | Application Locale Configuration
    |--------------------------------------------------------------------------
    |
    | The application locale determines the default locale that will be used
    | by the translation service provider. You are free to set this value
    | to any of the locales which will be supported by the application.
    |
    */

    'locale' => env('APP_LOCALE', 'en'),

    /*
    |--------------------------------------------------------------------------
    | Application Fallback Locale
    |--------------------------------------------------------------------------
    |
    | The fallback locale determines the locale to use when the current one
    | is not available. You may change the value to correspond to any of
    | the language folders that are provided through your application.
    |
    */

    'fallback_locale' => 'en',

    /*
    |--------------------------------------------------------------------------
    | Default Country
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default country by country code.
    | Ensure it is uppercase and reflects the 'code' column of the
    | countries table.
    |
    | for example: DE EN FR
    | (use capital letters!)
    */

    'default_country' => null,

    /*
    |--------------------------------------------------------------------------
    | Base Currency Code
    |--------------------------------------------------------------------------
    |
    | Here you may specify the base currency code for your application.
    |
    */

    'currency' => env('APP_CURRENCY', 'USD'),

    /*
    |--------------------------------------------------------------------------
    | Default channel Code
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default channel code for your application.
    |
    */

    'channel' => 'default',

    /*
    |--------------------------------------------------------------------------
    | Encryption Key
    |--------------------------------------------------------------------------
    |
    | This key is used by the Illuminate encrypter service and should be set
    | to a random, 32 character string, otherwise these encrypted strings
    | will not be safe. Please do this before deploying an application!
    |
    */

    'key' => env('APP_KEY'),

    'cipher' => 'AES-256-CBC',

    /*
    |--------------------------------------------------------------------------
    | Autoloaded Service Providers
    |--------------------------------------------------------------------------
    |
    | The service providers listed here will be automatically loaded on the
    | request to your application. Feel free to add your own services to
    | this array to grant expanded functionality to your applications.
    |
    */

    'providers' => ServiceProvider::defaultProviders()->merge([
        /**
         * Package service providers.
         */
        Astrotomic\Translatable\TranslatableServiceProvider::class,
        Barryvdh\DomPDF\ServiceProvider::class,
        Intervention\Image\ImageServiceProvider::class,
        Konekt\Concord\ConcordServiceProvider::class,
        Maatwebsite\Excel\ExcelServiceProvider::class,
        Prettus\Repository\Providers\RepositoryServiceProvider::class,

        /**
         * Application service providers.
         */
        App\Providers\AppServiceProvider::class,
        App\Providers\AuthServiceProvider::class,
        // App\Providers\BroadcastServiceProvider::class,
        App\Providers\EventServiceProvider::class,
        App\Providers\RouteServiceProvider::class,

        /**
         * Sakura package service providers.
         */
        Sakura\Admin\Providers\AdminServiceProvider::class,
        Sakura\Attribute\Providers\AttributeServiceProvider::class,
        Sakura\Category\Providers\CategoryServiceProvider::class,
        Sakura\Checkout\Providers\CheckoutServiceProvider::class,
        Sakura\CMS\Providers\CMSServiceProvider::class,
        Sakura\Core\Providers\CoreServiceProvider::class,
        Sakura\Core\Providers\EnvValidatorServiceProvider::class,
        Sakura\Customer\Providers\CustomerServiceProvider::class,
        Sakura\DataGrid\Providers\DataGridServiceProvider::class,
        Sakura\DebugBar\Providers\DebugBarServiceProvider::class,
        Sakura\FPC\Providers\FPCServiceProvider::class,
        Sakura\Inventory\Providers\InventoryServiceProvider::class,
        Sakura\Payment\Providers\PaymentServiceProvider::class,
        Sakura\Product\Providers\ProductServiceProvider::class,
        Sakura\Rule\Providers\RuleServiceProvider::class,
        Sakura\Sales\Providers\SalesServiceProvider::class,
        Sakura\Shipping\Providers\ShippingServiceProvider::class,
        Sakura\Shop\Providers\ShopServiceProvider::class,
        Sakura\Tax\Providers\TaxServiceProvider::class,
        Sakura\Theme\Providers\ThemeServiceProvider::class,
        Sakura\User\Providers\UserServiceProvider::class,
    ])->toArray(),

    /*
    |--------------------------------------------------------------------------
    | Class Aliases
    |--------------------------------------------------------------------------
    |
    | This array of class aliases will be registered when this application
    | is started. However, feel free to register as many as you wish as
    | the aliases are "lazy" loaded so they don't hinder performance.
    |
    */

    'aliases' => Facade::defaultAliases()->merge([
        'Captcha'      => Sakura\Customer\Facades\Captcha::class,
        'Cart'         => Sakura\Checkout\Facades\Cart::class,
        'Concord'      => Konekt\Concord\Facades\Concord::class,
        'Core'         => Sakura\Core\Facades\Core::class,
        'Excel'        => Maatwebsite\Excel\Facades\Excel::class,
        'Helper'       => Konekt\Concord\Facades\Helper::class,
        'Image'        => Intervention\Image\Facades\Image::class,
        'PDF'          => Barryvdh\DomPDF\Facade\Pdf::class,
        'ProductImage' => Sakura\Product\Facades\ProductImage::class,
        'Redis'        => Illuminate\Support\Facades\Redis::class,
    ])->toArray(),
];
