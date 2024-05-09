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
        <link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
    </head>
    <body style="background-color: #212529;">
        <mi-menu2></mi-menu2>
        <div class="container-fluid" style="position: relative; top:10px;">
            <div class="container" style="position: relative;top: 15px;">
            <div class="row">
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">CODIGO</p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">PERSONA</p>                        
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">FECHA</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">IMPORTE</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">ESTADO</p>
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center"> 
                    </div>
                </div>
            </div>

            <?php  while ($fila = mysqli_fetch_row($resultados)) { 
                $estadonum = htmlspecialchars ($fila[4]);
                $codigo = htmlspecialchars ($fila[0]);
                $persona = htmlspecialchars ($fila[1]);
                $fecha = htmlspecialchars ($fila[2]);
                $importe = htmlspecialchars ($fila[3]);
                $estado = traducirEstados ($estadonum);
                ?>

            <div class="container containerAdmin" style="margin-top:0px;">
                <div class="row">
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin2"><?php echo $codigo?></p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin2"><?php echo $persona?></p>
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center">
                        <p class="textAdmin2"><?php echo $fecha?></p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin2"><?php echo $importe?></p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin2"><?php echo $estado; ?></p>
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center">
                        <div class="button-container carrito">
                            <form method="post" action="pedidos-Control.php">
                                <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
                                <input type="hidden" name="estadonum" value="<?php echo $estadonum; ?>">
                                <button type="submit" class="boton-carrito">C.ESTADO</button>
                            </form>
                        </div>  
                    </div>
                </div>
            </div>
        <?php } ?>
		<script src="./js/mis-etiquetas.js"></script>
	</body>
</html>
<?php 
    } else {
        header('Location: login.php'); 
        exit;
    }
?>
