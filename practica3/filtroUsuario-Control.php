<?php require_once('baseDatos.php');

    session_start();

    $codigo = filter_input(INPUT_POST,'codigo');
    $estado = filter_input(INPUT_POST,'estadonum');

    ModificarEstado($codigo, $estado);

    header('Location: pedidos.php'); 
?>
