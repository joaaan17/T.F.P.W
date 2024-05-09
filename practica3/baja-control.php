<?php require_once('baseDatos.php');

    $usuario = filter_input(INPUT_POST, 'usuariobaja');
    $estado = filter_input(INPUT_POST, 'estado');

    if($estado == 1)
        darDeBaja($usuario);
    else{
        darDeAlta($usuario);
    }

    header('Location: usuarios.php'); 
?>