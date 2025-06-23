<?php

namespace Sakura\Theme\Exceptions;

class ThemeAlreadyExists extends \Exception
{
    /**
     * Create an instance.
     *
     * @param  \Sakura\Theme\Theme  $theme
     * @return void
     */
    public function __construct($theme)
    {
        parent::__construct("Theme {$theme->name} already exists", 1);
    }
}
