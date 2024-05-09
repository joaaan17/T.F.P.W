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
	    <form method="post" action="modificarUsuario-Control.php">
			<input type="hidden" name="codigo" value="<?php echo isset($_POST['codigo']) ? htmlspecialchars($_POST['codigo']) : ''; ?>"> 
		<div class="container-fluid">
			<div>
				<h4 style="color: aliceblue; font-family: Roboto Condensed; text-align: center; position: relative; top:10px;">REGISTRO PARA USUARIOS</h4>			
			</div>
			<div class="container RecPerfil">
					<div class="mb-3 mt-3">
					  <label for="uname" class="form-label"><span class="colorUsername"> Username:</span></label>
					  <input type="text" class="form-control" id="uname" placeholder="Enter username" name="usuario" value="<?php echo isset($_POST['usuario']) ? htmlspecialchars($_POST['usuario']) : ''; ?>" required>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Please fill out this field.</div>
					</div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> Nombre:</span></label>
                        <input type="text" class="form-control" placeholder="Enter nombre" name="nombre" value="<?php echo isset($_POST['nombre']) ? htmlspecialchars($_POST['nombre']) : ''; ?>" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> Apellidos:</span></label>
                        <input type="text" class="form-control" placeholder="Enter apellidos" name="apellidos" value="<?php echo isset($_POST['apellidos']) ? htmlspecialchars($_POST['apellidos']) : ''; ?>" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername">Domicilio</span></label>
                        <input type="text" class="form-control" placeholder="Enter domicilio" name="domicilio" value="<?php echo isset($_POST['domicilio']) ? htmlspecialchars($_POST['domicilio']) : ''; ?>" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> Provincia:</span></label>
                        <input type="text"class="form-control" placeholder="Enter provincia" name="provincia" value="<?php echo isset($_POST['provincia']) ? htmlspecialchars($_POST['provincia']) : ''; ?>" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername">CP:</span></label>
                        <input type="text" class="form-control" placeholder="Enter codigo postal" name="cp" value="<?php echo isset($_POST['cp']) ? htmlspecialchars($_POST['cp']) : ''; ?>" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label"><span class="colorUsername"> Telefono:</span></label>
                        <input type="text" class="form-control" placeholder="Enter telefono" name="tlf" <?php echo isset($_POST['tlf']) ? htmlspecialchars($_POST['tlf']) : ''; ?> required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
					<button type="submit" class="btn btn-outline-secondary">Edita</button>
					<br><br>		
				</div>
		</div>
    </form>

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