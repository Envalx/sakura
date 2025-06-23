<?php

namespace Sakura\Core\Console\Commands;

use Illuminate\Console\Command;

class ApplicationVersion extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'application:version';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Displays current version of application installed';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->comment('v'.core()->version());
    }
}
