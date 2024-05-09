<?php require_once('baseDatos.php');
    ini_set('session.gc_maxlifetime', 30); // 1 hora

    session_start();

    $usuario = filter_input(INPUT_POST,'usuario');

    $clave = filter_input(INPUT_POST,'clave');

    comprobarUsuario($usuario, $clave);

    if (isset($_SESSION['usuario']) && $_SESSION['logueado'] === true){
        header('Location: administracion.php'); 
    }else{
        header('Location: login.php'); 
    }

?>