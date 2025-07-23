<?php
namespace Controllers\Pages;

use \Utilities\Site as Site;
use Views\Renderer;
use Controllers\PublicController;
use Dao\Products\Products as ProductsDao;

class detailProducts extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/pages/detailProducts.css");
        Site::addLink("public/css/pages/products.css");

        $productId = isset($_GET['productId']) ? intval($_GET['productId']) : 0;

        $viewData = [];

        if ($productId > 0) {
            $product = ProductsDao::getProductById($productId);
           if ($product) {
                $product['originalPrice'] = number_format($product['originalPrice'], 2, '.', ',');
                $product['productPrice'] = number_format($product['productPrice'], 2, '.', ',');
                if (!empty($product['discount'])) {
                    $product['displayPrice'] = '<span class="original-price">L. ' . $product['originalPrice'] . '</span> L. ' . $product['productPrice'];
                } else {
                    $product['displayPrice'] = 'L. ' . $product['originalPrice'];
                }
                $viewData = $product;
            }
        } else {
            Site::redirectTo("index.php?page=Pages\categories");
            return;
        }
            
        $viewData = $product;
        Renderer::render("pages/detailProducts", $viewData);
    }
}
