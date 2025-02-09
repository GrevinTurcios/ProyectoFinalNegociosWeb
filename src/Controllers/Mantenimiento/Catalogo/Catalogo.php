<?php

namespace Controllers\Mantenimiento\Catalogo;

use \Dao\Catalogo\Catalogo as DaoCatalogo;
use \Dao\Catalogo\Categories as DaoCategories;
use \Utilities\Validators as Validators;
use \Utilities\Site as Site;

class Catalogo extends \Controllers\PrivateController
{

    private $mode = "NAN";
    private $modeDscArr = [
        "INS" => "Nuevo Producto",
        "UPD" => "Actualizando Producto %s",
        "DSP" => "Detalle de %s",
        "DEL" => "Eliminando %s"
    ];
    private $modeDsc = "";

    private $id = 0;
    private $prdname = "";
    private $price = 0;
    private $stock = 0;
    private $status = "ACT";
    private $imagen = "";
    private $category_id = 0;

    private $categories = [];

    private $errors = array();
    private $xsrftk = "";

    public function run(): void
    {
        $this->obtenerDatosDelGet();
        $this->getDatosFromDB();
        if ($this->isPostBack()) {
            $this->obtenerDatosDePost();
            if (count($this->errors) === 0) {
                $this->procesarAccion();
            }
        }
        $this->showView();
    }
    private function obtenerDatosDelGet()
    {
        if (isset($_GET["mode"])) {
            $this->mode = $_GET["mode"];
        }
        if (!isset($this->modeDscArr[$this->mode])) {
            throw new \Exception("Modo no valido");
        }
        if (isset($_GET["id"])) {
            $this->id = intval($_GET["id"]);
        }
        if ($this->mode != "INS" && $this->id <= 0) {
            throw new \Exception("ID no valido");
        }
    }
    private function getDatosFromDB()
    {
        if ($this->id > 0) {
            $catalogo = DaoCatalogo::readProducto($this->id);
            if (!$catalogo) {
                throw new \Exception("Producto no encontrado");
            }
            $this->prdname = $catalogo["name"];
            $this->price = $catalogo["price"];
            $this->stock = $catalogo["stock"];
            $this->status = $catalogo["status"];
            $this->imagen = $catalogo["imagen"];
            $this->category_id = $catalogo["category_id"];
        }
    }
    private function obtenerDatosDePost()
    {
        $tmpName = $_POST["name"] ?? "";
        $tmpPrice = $_POST["price"] ?? "";
        $tmpStock = $_POST["stock"] ?? "";
        $tmpStatus = $_POST["status"] ?? "";
        $tmpImagen = $_POST["imagen"] ?? "";
        $tmpMode = $_POST["mode"] ?? "";
        $tmpXsrfTk = $_POST["xsrftk"] ?? "";
        $tmpCategory_id = $_POST["category"] ?? 0;

        $this->getXSRFToken();
        if (!$this->compareXSRFToken($tmpXsrfTk)) {
            $this->throwError("Ocurrio un error al procesar la solicitud.");
        }

        if (Validators::IsEmpty($tmpName)) {
            $this->addError("name", "El nombre no puede estar vacio", "error");
        }
        $this->prdname = $tmpName;

        if (Validators::IsEmpty($tmpImagen)) {
            $this->addError("imagen", "El nombre no puede estar vacio", "error");
        }
        $this->imagen = $tmpImagen;


        if (Validators::IsEmpty($tmpPrice)) {
            $this->addError("price", "El precio no puede estar vacio", "error");
        } elseif (!Validators::IsCurrency($tmpPrice)) {
            $this->addError("price", "El precio no es valido", "error");
        }
        $this->price = $tmpPrice;

        if (Validators::IsEmpty($tmpStock)) {
            $this->addError("stock", "El stock no puede estar vacio", "error");
        } elseif (!Validators::IsInteger($tmpStock)) {
            $this->addError("stock", "El stock no es valido", "error");
        }
        $this->stock = $tmpStock;

        if (Validators::IsEmpty($tmpStatus)) {
            $this->addError("status", "El status no puede estar vacio", "error");
        } elseif (!in_array($tmpStatus, ["ACT", "INA"])) {
            $this->addError("status", "El status no es valido", "error");
        }
        $this->status = $tmpStatus;

        if (Validators::IsEmpty($tmpMode) || !in_array($tmpMode, ["INS", "UPD", "DEL"])) {
            $this->throwError("Ocurrio un error al procesar la solicitud.");
        }

        if ($tmpCategory_id <= 0) {
            $this->addError("category", "La categoria no puede estar vacia", "error");
        }

        $this->category_id = $tmpCategory_id;
    }
    private function procesarAccion()
    {
        switch ($this->mode) {
            case "INS":
                $insResult = DaoCatalogo::createProducto(
                    $this->prdname,
                    $this->price,
                    $this->stock,
                    $this->status,
                    $this->imagen,
                    $this->category_id
                );
                $this->validateDBOperation(
                    "Producto insertado correctamente",
                    "Ocurrio un error al insertar el producto",
                    $insResult
                );
                break;
            case "UPD":
                $updResult = DaoCatalogo::updateProducto(
                    $this->id,
                    $this->prdname,
                    $this->price,
                    $this->stock,
                    $this->status,
                    $this->imagen,
                    $this->category_id
                );
                $this->validateDBOperation(
                    "Producto actualizado correctamente",
                    "Ocurrio un error al actualizar el producto",
                    $updResult
                );
                break;
            case "DEL":
                $delResult = DaoCatalogo::deleteProducto($this->id);
                $this->validateDBOperation(
                    "Producto eliminado correctamente",
                    "Ocurrio un error al eliminar el producto",
                    $delResult
                );
                break;
        }
    }
    private function validateDBOperation($msg, $error, $result)
    {
        if (!$result) {
            $this->errors["error_general"] = $error;
        } else {
            Site::redirectToWithMsg(
                "index.php?page=Mantenimiento-Catalogo-Catalogos",
                $msg
            );
        }
    }

    private function throwError($msg)
    {
        Site::redirectToWithMsg(
            "index.php?page=Mantenimiento-Catalogo-Catalogos",
            $msg
        );
    }

    private function addError($key, $msg, $context = "general")
    {
        if (!isset($this->errors[$context . "_" . $key])) {
            $this->errors[$context . "_" . $key] = [];
        }
        $this->errors[$context . "_" . $key][] = $msg;
    }

    private function generateXSRFToken()
    {
        $this->xsrftk = md5(uniqid(rand(), true));
        $_SESSION[$this->name . "_xsrftk"] = $this->xsrftk;
    }
    private function getXSRFToken()
    {
        if (isset($_SESSION[$this->name . "_xsrftk"])) {
            $this->xsrftk = $_SESSION[$this->name . "_xsrftk"];
        }
    }
    private function compareXSRFToken($postXSFR)
    {
        return $postXSFR === $this->xsrftk;
    }

    private function prepararCategories()
    {
        $tmpCategories = DaoCategories::getCategoriesForCombo();
        $this->categories = [];
        foreach ($tmpCategories as $category) {
            if ($category["category_id"] == $this->category_id) {
                $category["categorySelected"] = "selected";
            } else {
                $category["categorySelected"] = "";
            }
            $this->categories[] = $category;
        }
    }
    private function showView()
    {
        $this->generateXSRFToken();
        $viewData = array();
        $viewData["mode"] = $this->mode;
        $viewData["modeDsc"] = sprintf($this->modeDscArr[$this->mode], $this->prdname);
        $viewData["id"] = $this->id;
        $viewData["name"] = $this->prdname;
        $viewData["price"] = $this->price;
        $viewData["stock"] = $this->stock;
        $viewData["status"] = $this->status;
        $viewData["errors"] = $this->errors;
        $viewData["prdest" . $this->status] = "selected";
        $viewData["xsrftk"] = $this->xsrftk;
        $viewData["isReadOnly"] = in_array($this->mode, ["DEL", "DSP"]) ? "readonly" : "";
        $viewData["isDisplay"] = $this->mode == "DSP";
        $this->prepararCategories();
        $viewData["imagen"] = $this->imagen;
        $viewData["categories"] = $this->categories;
        \Views\Renderer::render("mantenimientos/catalogos/form", $viewData);
    }
}
