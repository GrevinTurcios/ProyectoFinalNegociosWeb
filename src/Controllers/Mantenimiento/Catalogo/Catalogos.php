<?php

namespace Controllers\Mantenimiento\Catalogo;


use \Dao\Catalogo\Catalogo as DaoCatalogo;

const SESSION_CATALOGOS_SEARCH = "catalogos_search_data";

const CATALOGO_NEW = "mnt_catalogo_new";
const CATALOGO_UPD = "mnt_catalogo_upt";
const CATALOGO_DEL = "mnt_catalogo_del";

class Catalogos extends \Controllers\PrivateController
{
  public function run(): void
  {
    $viewData = array();
    $viewData["search"] = $this->getSessionSearchData();
    if ($this->isPostBack()) {
      $viewData["search"] = $this->getSearchData();
      $this->setSessionSearchData($viewData["search"]);
    }
    $viewData["catalogo"] = DaoCatalogo::readAllProductos($viewData["search"]);
    $viewData["total"] = count($viewData["catalogo"]);

    $viewData[CATALOGO_NEW] = $this->isFeatureAutorized(CATALOGO_NEW);
    $viewData[CATALOGO_UPD] = $this->isFeatureAutorized(CATALOGO_UPD);
    $viewData[CATALOGO_DEL] = $this->isFeatureAutorized(CATALOGO_DEL);


    \Views\Renderer::render("mantenimientos/catalogos/lista", $viewData);
  }

  private function getSearchData()
  {
    if (isset($_POST["search"])) {
      return $_POST["search"];
    }
    return "";
  }


  private function getSessionSearchData()
  {
    if (isset($_SESSION[SESSION_CATALOGOS_SEARCH])) {
      return $_SESSION[SESSION_CATALOGOS_SEARCH];
    }
    return "";
  }

  private function setSessionSearchData($search)
  {
    $_SESSION[SESSION_CATALOGOS_SEARCH] = $search;
  }
}
