<?php 

namespace Controllers\Landing;
use Controllers\PublicController;
use Dao\Catalogo\Catalogo;
use Views\Renderer;

class CatalogoProductos extends PublicController{

    public function run(): void
    {
        
        $viewData = array();
        $viewData["Catalogo"] = Catalogo::getCatalogoProductos();

        Renderer::render('catalogo/catalogoProductos', $viewData);

    }
}