<?php require_once('baseDatos.php');

    session_start();

    $codigo = filter_input(INPUT_POST,'codigo');
    $usuario = filter_input(INPUT_POST,'usuario');
    $nombre = filter_input(INPUT_POST,'nombre');
    $apellidos = filter_input(INPUT_POST,'apellidos');
    $domicilio = filter_input(INPUT_POST,'domicilio');
    $provincia = filter_input(INPUT_POST,'provincia');
    $telefono = filter_input(INPUT_POST,'tlf');
    $cp = filter_input(INPUT_POST,'cp');

    ModificaUsuario($codigo ,$usuario, $nombre, $apellidos, $domicilio, $provincia, $telefono, $cp);

    header('Location: administracion.php'); 
?>
