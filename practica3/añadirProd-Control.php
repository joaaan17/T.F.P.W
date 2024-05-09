<?php require_once('baseDatos.php');

    session_start();

    $imagen = filter_input(INPUT_POST,'imagenURL');
    $descripcion = filter_input(INPUT_POST,'descripcion');
    $existencias = filter_input(INPUT_POST,'existencias');
    $precio = filter_input(INPUT_POST,'precio');

    AnadirProducto($imagen, $descripcion, $existencias, $precio);

    header('Location: administracion.php'); 
?>