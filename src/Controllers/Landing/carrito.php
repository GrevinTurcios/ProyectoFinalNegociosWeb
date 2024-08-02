<?php

namespace Controllers\Landing;

use Controllers\PrivateController;
use Controllers\PublicController;
use Dao\Catalogo\Catalogo;
use Views\Renderer;

class carrito extends PrivateController
{

    public function run(): void
    {

        $viewData = array();
        $viewData["Catalogo"] = Catalogo::getCatalogoProductos();

        Renderer::render('carrito/carrito', $viewData);
    }
}
