<?php

class Empleados {

  public function listar($fluent) {
    return $fluent
         ->from('persona_reunion')
         ->select('persona, conteo, grupos')
         ->fetchAll();
  }

  public function registrar($fluent, $data) {
    $fluent->insertInto('influencias', $data)
             ->execute();
    return true;
  }

}
