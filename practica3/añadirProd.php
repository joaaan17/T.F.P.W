<?php require_once('baseDatos.php');
   session_start();
    if (isset($_SESSION['usuario']) && $_SESSION['logueado'] === true) {

?>
<!DOCTYPE html>
<html lang="es">
	<head>
		<title>T.F.P.W</title>
		<link rel="icon" type="image/ico" href="img/icono.ico" sizes="64x64">
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="CSS/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Permanent+Marker&display=swap" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </head>
	<body style="background-color: #212529;">
    <mi-menu2></mi-menu2>
			
		<div class="container-fluid">
			<div>
				<h4 style="color: aliceblue; font-family: Roboto Condensed; text-align: center; position: relative; top:10px;">MODIFICAR PRODUCTO</h4>			
			</div>
			<div class="container RecPerfil">
				<form method="post" action="añadirProd-Control.php">
					<div class="mb-3 mt-3">
					  <label for="uname" class="form-label"><span class="colorUsername"> DESCRIPCION:</span></label>
					  <input type="text" class="form-control" id="uname" placeholder="descripcion" name="descripcion"  required>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="mb-3">
					  <label for="pwd" class="form-label"><span class="colorUsername"> PRECIO:</span></label>
					  <input type="text" class="form-control" id="pwd" placeholder="precio" name="precio" required>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Please fill out this field.</div>
					</div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> EXISTENCIAS:</span></label>
                        <input type="text" class="form-control" id="pwd" placeholder="existencias" name="existencias" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> IMAGEN:</span></label>
                        <input type="text" class="form-control" id="pwd" placeholder="url-imagen" name="imagenURL"  required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
						<input type="hidden" name="codigo" >
						<button type="submit" class="btn btn-outline-secondary">Añadir</button>
                    </form> 
		
		</div>

		<mi-pie style="position: relative; top: 500px;"></mi-pie>
		<script src="./js/mis-etiquetas.js"></script>        
	</body>
</html>
<?php 
    } else {
        header('Location: login.php'); 
        exit;
    }
?>