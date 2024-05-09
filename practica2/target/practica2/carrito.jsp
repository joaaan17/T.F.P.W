<%@page language="java" contentType="text/html charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>T.F.P.W</title>
		<link rel="icon" type="image/ico" href="img/icono.ico" sizes="64x64">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="CSS/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Permanent+Marker&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="./js/carrito.js"></script>
		<script src="./js/ProcesarCarrito.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
	</head>
	<body onload="cargarCarrito()" style="background-color: #212529;">
		<mi-menu2></mi-menu2>      
		<div class="container-fluid" id="etiqueta">
			<div style="position: relative; top: 80px;" id="listaCarrito"></div>
			<div class="container" id="preciototal"></div>
			<input type="button" style="color: aliceblue;" class="boton-carrito vaciar" value="vaciar carro" onclick="vaciarCarrito()">
			<input type="button" style="color: aliceblue;" class="boton-carrito vaciar" value="Terminar pago" onclick="cargarCarrito();EnviarCarrito('RecogerCarrito.html','etiqueta',carrito);false; vaciarCarrito()">
		</div>

		<script src="./js/mis-etiquetas.js"></script>

	</body>
	</html>


