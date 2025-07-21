<?php
namespace Controllers\Pages;

use \Utilities\Site as Site;
use Views\Renderer;
use Controllers\PublicController;  

class categories extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/pages/categories.css");
        $viewData = [];

        Renderer::render('pages/categories', $viewData);
    }
}
