<?php

namespace Controllers\Modules\Sales;

use Controllers\PublicController;
use Dao\modules\sales\Sales as SalesDAO;
use Views\Renderer;

class Sales extends PublicController
{
    private array $viewData;

    public function __construct()
    {
        $this->viewData = [];
    }

    public function run(): void
    {
        // Obtener todas las ventas
        $this->viewData["sales"] = SalesDAO::getAll();

        // Renderizar la vista correspondiente
        Renderer::render("modules/sales/sales", $this->viewData);
    }
}
