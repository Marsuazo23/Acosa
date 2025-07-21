<?php
namespace Controllers;

use Views\Renderer; 

class aboutUs extends PublicController
{
    public function run(): void
    {
        $viewData = [];

        Renderer::render('aboutUs', $viewData);
    }
}
