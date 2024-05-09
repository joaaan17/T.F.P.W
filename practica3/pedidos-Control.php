<?php require_once('baseDatos.php');

    session_start();

    $pesona = filter_input(INPUT_POST,'persona');

    $pedidos = BuscarPedidosPersona($persona);

    header('Location: pedidosFiltro.php'); 
?>
