<?php

namespace Dao\Catalogo;

use Dao\Table;

class categories extends Table
{

    public static function getCategoriesForCombo(): array
    {
        $sqlstr = "SELECT category_id, category_name from categories where category_status='ACT';";
        return self::obtenerRegistros($sqlstr, array());
    }
}
