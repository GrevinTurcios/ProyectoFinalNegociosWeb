<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Error extends PublicController
{
    public function run(): void
    {
        echo "error porfavor vuelva a la pagina anterior o inicie sesion nuevamente para salir de esta pantalla";
        die();
    }
}
