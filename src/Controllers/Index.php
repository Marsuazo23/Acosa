<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */

use \Dao\Products\Products as ProductsDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class Index extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/Pages/products.css");
        Site::addLink("public/css/Pages/slider.css");
        Site::addLink("public/css/Pages/ads.css");

        $viewData = [];
        $viewData["productsOnSale"] = ProductsDao::getDailyDeals();
        $viewData["featuredByCategory"] = ProductsDao::getOneProductPerCategory();

        Renderer::render("index", $viewData);
    }
}
?>
