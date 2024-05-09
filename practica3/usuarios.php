<?php require_once('baseDatos.php');
   session_start();
    if (isset($_SESSION['usuario']) && $_SESSION['logueado'] === true) {

        $resultados = obtenerUsuarios();

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
                    <p class="textAdmin">ACTIVO</p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">USUARIO</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">NOMBRE</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">APELLIDOS</p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">DOMICILIO</p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">PROVINCIA</p>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">TELEFONO</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                    </div>

            </div>

            <?php  while ($fila = mysqli_fetch_row($resultados)) { 
                  $codigo =  htmlspecialchars($fila[0]);
                  $activo =  htmlspecialchars($fila[1]);
                  $usuario =  htmlspecialchars($fila[3]);
                  $nombre =  htmlspecialchars($fila[5]);
                  $apellidos =  htmlspecialchars($fila[6]);
                  $domicilio =  htmlspecialchars($fila[7]);
                  $provincia =  htmlspecialchars($fila[9]);
                  $telefono =  htmlspecialchars($fila[11]);
                  $cp = htmlspecialchars($fila[10]);
                ?>
                <div class="container containerAdmin" style="margin-top:0px;">
                    <div class="row">
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $codigo?></p>
                        </div>
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $activo?></p>
                        </div>
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $usuario?></p>
                        </div>
                        <div class="col-2 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $nombre?></p>
                        </div>
                        <div class="col-2 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $apellidos?></p>
                        </div>
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $domicilio?></p>
                        </div>
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $provincia?></p>
                        </div>
                        <div class="col-1 d-flex justify-content-center align-items-center">
                            <p class="textAdmin2"><?php echo $telefono?></p>
                        </div>
                        <div class="col-2 d-flex justify-content-center align-items-center">
                            <div class="button-container carrito">
                                <?php  if($activo == 1){ ?>
                                        <form method="post" action="baja-Control.php">
                                            <input type="hidden" name="usuariobaja" value="<?php echo $codigo ?>">
                                            <input type="hidden" name="estado" value="<?php echo $activo ?>">
                                            <button type="submit" class="boton-carrito">BAJA</button>
                                        </form>
                                    <?php }else{ ?>
                                        <form method="post" action="baja-Control.php">
                                            <input type="hidden" name="usuariobaja" value="<?php echo $codigo ?>">
                                            <input type="hidden" name="estado" value="<?php echo $activo ?>">
                                            <button type="submit" class="boton-carrito">ALTA</button>
                                        </form>
                                <?php } ?>
                                <form method="post" action="modificarUsuario.php">
                                    <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
                                    <input type="hidden" name="usuario" value="<?php echo $usuario; ?>">
                                    <input type="hidden" name="nombre" value="<?php echo $nombre; ?>">
                                    <input type="hidden" name="apellidos" value="<?php echo $apellidos; ?>">
                                    <input type="hidden" name="domicilio" value="<?php echo $domicilio; ?>">
                                    <input type="hidden" name="provincia" value="<?php echo $provincia; ?>">
                                    <input type="hidden" name="tlf" value="<?php echo $telefono; ?>">
                                    <input type="hidden" name="cp" value="<?php echo $cp; ?>">
                                    <button type="submit" class="boton-carrito">EDITA</button>
                                </form>
                            </div>
                         </div>
                    </div>
                </div>
            <?php } ?>



            <br><br>
		<script src="./js/mis-etiquetas.js"></script>
	</body>
</html>
<?php 
    } else {
        header('Location: login.php'); 
        exit;
    }
?>
