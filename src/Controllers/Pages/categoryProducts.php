<?php
namespace Controllers\Pages;

use \Utilities\Site as Site;
use Views\Renderer;
use Controllers\PublicController;
use Dao\Products\Categories;

class categoryProducts extends PublicController
{
    public function run(): void
    {
        // Se agregan los archivos CSS
        Site::addLink("public/css/pages/products.css");

        // Obtiene el ID de la categoría desde la URL (GET), o 0 si no está definido
        $categoryId = isset($_GET["categoryId"]) ? intval($_GET["categoryId"]) : 0;

        // Obtiene el nombre de la categoría desde la URL (GET), o un nombre por defecto
        $categoryName = isset($_GET["name"]) ? urldecode($_GET["name"]) : "Categoría";

        // Llama al modelo para obtener todos los productos de esa categoría
        $products = Categories::getProductsByCategory($categoryId);

        // Recorre los productos para formatear los datos visualmente
        foreach ($products as &$product) {
            // Si el producto tiene descuento
            if (!empty($product['discount'])) {
                // Muestra el valor del descuento en un div con clase "discount"
                $product['discount'] = '<div class="discount">' . $product['discount'] . '</div>';

                // Muestra el precio original con formato y tachado (CSS .original-price)
                $product['originalPrice'] = '<span class="original-price">L. ' . number_format($product['originalPrice'], 2, '.', ',') . '</span> ';

                // Formatea el precio con dos decimales y coma como separador de miles
                $product['productPrice'] = number_format($product['productPrice'], 2, '.', ',');
            } else {
                // Si no hay descuento, no se muestra el bloque
                $product['discount'] = '';
                $product['originalPrice'] = '';
                $product['productPrice'] = number_format($product['productPrice'], 2, '.', ',');
            }
        }
        unset($product); // Limpia la referencia por seguridad

        // Array que contendrá los datos a enviar a la vista
        $viewData = [
            "categoryName" => $categoryName, // Nombre de la categoría
            "products" => $products          // Lista de productos procesada
        ];

        // Renderiza la vista y pasa los datos recopilados
        Renderer::render("pages/categoryProducts", $viewData);
    }
}


