<?php

namespace Controllers\Modules\Products;

use Controllers\PublicController;
use Dao\modules\products\Products as ProductsDAO;
use Views\Renderer;

class Products extends PublicController
{
    private array $viewData;

    public function __construct()
    {
        $this->viewData = [];
    }

    public function run(): void
    {
        // Obtener todos los productos
        $this->viewData["products"] = ProductsDAO::getAll();

        // Renderizar la vista correspondiente
        Renderer::render("modules/products/products", $this->viewData);
    }
}
