<?php

namespace Sakura\Core\Console\Commands;

use Illuminate\Console\Command;

class ApplicationPublish extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'application:publish { --force : Overwrite any existing files }';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish the available assets';

    /**
     * List of providers.
     *
     * @var array
     */
    protected $providers = [
        /**
         * application providers.
         */
        [
            'name'     => 'Core',
            'provider' => \Sakura\Core\Providers\CoreServiceProvider::class,
        ],
        [
            'name'     => 'Product',
            'provider' => \Sakura\Product\Providers\ProductServiceProvider::class,
        ],
    ];

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $this->publishAllPackages();
    }

    /**
     * Publish all packages.
     */
    public function publishAllPackages(): void
    {
        collect($this->providers)->each(function ($provider) {
            $this->publishPackage($provider);
        });
    }

    /**
     * Publish package.
     */
    public function publishPackage(array $provider): void
    {
        $this->line('');
        $this->line('-----------------------------------------');
        $this->info('Publishing '.$provider['name']);
        $this->line('-----------------------------------------');

        $this->call('vendor:publish', [
            '--provider' => $provider['provider'],
            '--force'    => $this->option('force'),
        ]);
    }
}
