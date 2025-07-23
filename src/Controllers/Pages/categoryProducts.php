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

        $products = Products::getProductsByCategory($categoryId);

        foreach ($products as &$product) {
            if (!empty($product['discount'])) {
                $product['discount'] = '<div class="discount">' . $product['discount'] . '</div>';
                $product['originalPrice'] = '<span class="original-price">L. ' . number_format($product['originalPrice'], 2, '.', ',') . '</span> ';
                $product['productPrice'] = number_format($product['productPrice'], 2, '.', ',');
            } else {
                $product['discount'] = '';
                $product['originalPrice'] = '';
                $product['productPrice'] = number_format($product['productPrice'], 2, '.', ',');
            }
        }
        unset($product);


        $viewData = [
            "categoryName" => $categoryName,
            "products" => $products
        ];

        Renderer::render("pages/categoryProducts", $viewData);
    }
}

