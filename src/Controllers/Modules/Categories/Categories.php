<?php

namespace Controllers\Modules\Categories;

use Controllers\PublicController;
use Dao\modules\categories\Category as CategoriesDAO;
use Views\Renderer;

class Categories extends PublicController
{
    private array $viewData;

    public function __construct()
    {
        $this->viewData = [];
    }

    public function run(): void
    {
        // Obtener todas las categorías
        $this->viewData["categories"] = CategoriesDAO::getAll();

        // Renderizar la vista correspondiente
        Renderer::render("modules/categories/categories", $this->viewData);
    }
}
