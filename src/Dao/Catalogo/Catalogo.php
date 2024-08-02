<?php

namespace Dao\Catalogo;

class Catalogo extends \Dao\Table
{

    public static function getCatalogoProductos(): array
    {
        $sqlstr = "SELECT id as id, name as nombre , price as precio, imagen as imagen, stock from catalogo;";
        $Catalogo = self::obtenerRegistros($sqlstr, array());
        return $Catalogo;
    }

    public static function createProducto(
        $name,
        $price,
        $stock,
        $status,
        $imagen,
        $category_id
    ) {
        $InsSql = "INSERT INTO catalogo (name, price, stock, status, create_time, imagen, category_id)
        VALUES (:name, :price, :stock, :status, now(), :imagen, :category_id);"; // Se añadió :stock aquí
        $insParams = [
            'name' => $name,
            'price' => $price,
            'stock' => $stock, // Se añadió esta línea
            'status' => $status,
            'imagen' => $imagen,
            'category_id' => $category_id
        ];
        return self::executeNonQuery($InsSql, $insParams);
    }
    public static function updateProducto(
        $id,
        $name,
        $price,
        $stock,
        $status,
        $imagen,
        $category_id
    ) {
        $UpdSql = "UPDATE catalogo SET name = :name, price = :price, stock = :stock, status = :status, imagen = :imagen, category_id = :category_id WHERE id = :id;";
        $updParams = [
            'id' => $id,
            'name' => $name,
            'price' => $price,
            'stock' => $stock,
            'status' => $status,
            'imagen' => $imagen,
            'category_id' => $category_id
        ];
        return self::executeNonQuery($UpdSql, $updParams);
    }
    public static function deleteProducto($id)
    {
        $DelSql = "DELETE from catalogo where id = :id;";
        $delParams = ['id' => $id];
        return self::executeNonQuery($DelSql, $delParams);
    }

    public static function readAllProductos($filter = '')
    {
        $sqlstr = "SELECT a.*, b.category_name from catalogo a inner join categories b on a.category_id = b.category_id where name like :filter;";
        $params = array('filter' => '%' . $filter . '%');
        return self::obtenerRegistros($sqlstr, $params);
    }

    public static function readProducto($id)
    {
        $sqlstr = "SELECT * from catalogo where id = :id;";
        $params = array('id' => $id);
        return self::obtenerUnRegistro($sqlstr, $params);
    }
}
