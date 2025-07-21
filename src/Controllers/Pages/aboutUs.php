<?php
namespace Controllers\Pages;

use \Utilities\Site as Site;
use Views\Renderer;
use Controllers\PublicController;  

class aboutUs extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/pages/aboutUs.css");
        $viewData = [];

        Renderer::render('pages/aboutUs', $viewData);
    }
}
