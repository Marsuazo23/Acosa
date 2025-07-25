<?php

namespace Controllers\Modules\Usuarios;

use Controllers\PublicController;
use Dao\modules\usuarios\Usuarios as UsuarioDAO;
use Views\Renderer;

class Usuarios extends PublicController
{
    private array $viewData;

    public function __construct()
    {
        $this->viewData = [];
    }

    public function run(): void
    {
        // Obtener todos los usuarios (sin mostrar password ni useractcod)
        $this->viewData["usuarios"] = UsuarioDAO::getAll();

        // Renderizar la vista correspondiente
        Renderer::render("modules/usuarios/usuarios", $this->viewData);
    }
}
