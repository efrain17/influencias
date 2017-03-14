<?php

// Cargamos Vendor
require __DIR__ . '/vendor/autoload.php';
include '../modelos/empleados.php';

$pdo = new PDO('mysql:host=localhost;dbname=prueba;charset=utf8', 'root', '123456');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

$fluent = new FluentPDO($pdo);
$obj =  new Empleados();
$action = isset($_GET['a']) ? $_GET['a'] : null;

switch($action) {
  case 'listar':
    header('Content-Type: application/json');
    print_r(json_encode($obj->listar($fluent)));
    break;
  case 'registrar':
    header('Content-Type: application/json');
    $data = json_decode(utf8_encode(file_get_contents("php://input")), true);
    print_r(json_encode($obj->registrar($fluent, $data)));
    break;
}
