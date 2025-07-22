<?php
namespace Controllers\Pages;

use \Utilities\Site as Site;
use Views\Renderer;
use Controllers\PublicController;
use Dao\Products\Products;

class categoryProducts extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/pages/products.css");

        $categoryId = isset($_GET["categoryId"]) ? intval($_GET["categoryId"]) : 0;
        $categoryName = isset($_GET["name"]) ? urldecode($_GET["name"]) : "Categoría";

        $viewData = [
            "categoryName" => $categoryName,
            "products" => Products::getProductsByCategory($categoryId)
        ];

        Renderer::render("pages/categoryProducts", $viewData);
    }
}
