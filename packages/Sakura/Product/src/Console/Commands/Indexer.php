<?php

namespace Sakura\Product\Console\Commands;

use Illuminate\Console\Command;
use Sakura\Product\Helpers\Indexers\ElasticSearch;
use Sakura\Product\Helpers\Indexers\Flat;
use Sakura\Product\Helpers\Indexers\Inventory;
use Sakura\Product\Helpers\Indexers\Price;

class Indexer extends Command
{
    protected $indexers = [
        'inventory' => Inventory::class,
        'price'     => Price::class,
        'flat'      => Flat::class,
        'elastic'   => ElasticSearch::class,
    ];

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'indexer:index {--type=*} {--mode=*}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Automatically updates product price and inventory indices';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $start = microtime(true);

        $indexerIds = ['inventory', 'price', 'flat', 'elastic'];

        if (! empty($this->option('type'))) {
            $indexerIds = $this->option('type');
        }

        $mode = 'selective';

        if (! empty($this->option('mode'))) {
            $mode = current($this->option('mode'));
        }

        foreach ($indexerIds as $indexerId) {
            if (
                $indexerId == 'elastic'
                && core()->getConfigData('catalog.products.search.engine') != 'elastic'
            ) {
                continue;
            }

            $indexer = app($this->indexers[$indexerId]);

            if ($mode == 'full') {
                $indexer->reindexFull();
            } else {
                if ($indexerId != 'inventory') {
                    $indexer->reindexSelective();
                }
            }
        }

        $end = microtime(true);

        echo 'The code took '.($end - $start)." seconds to complete.\n";
    }
}
