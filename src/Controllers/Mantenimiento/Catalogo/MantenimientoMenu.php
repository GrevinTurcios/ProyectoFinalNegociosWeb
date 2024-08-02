<?php

namespace Controllers\Mantenimiento\Catalogo;

use Controllers\PrivateController;
use Views\Renderer;

class MantenimientoMenu extends PrivateController
{
    public function run(): void
    {
        Renderer::render('mantenimientos/Menu', []);
    }
}
