<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>

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
		<link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
	<body style="background-color: #212529;">

        <%
        String usuarioRegistrado = String.valueOf(session.getAttribute("usuario"));
        AccesoBD con = AccesoBD.getInstance();
        Usuario usuario = con.obtenerUsuarioVentaBD(usuarioRegistrado);

        String alias = usuario.getUsuario();
        String nombre = usuario.getNombre();
        String apellidos = usuario.getApellidos();
        String domicilio = usuario.getDomicilio();
        String cp = usuario.getCP();
        String codigo = String.valueOf(usuario.getCodigo());
        %>

        <mi-menu2></mi-menu2>

        <div class="container-fluid">
            <div class="row">
                <div id="CosasPerfil" class="col-sm-6">
                    <form method="post" action="ModificarDatos.html">
                        <input type="hidden" name="codigo" value="<%=codigo%>"> 
                        <input type="hidden" name="codigousuario" value="<%=alias%>"> 
                        <input type="hidden" name="url" value="UserPerfil.jsp"> 
                        <label class="form-label"><span class="colorUsername2 " > User:</span></label>
                        <input type="text" class="form-control" placeholder="User" name="usuario" value="<%=alias%>" readonly>
                        <label class="form-label"><span class="colorUsername2" > Nombre:</span></label>
                        <input name="nombre" type="text" class="form-control" placeholder="Nombre" value="<%=nombre%>">
                        <label class="form-label"><span class="colorUsername2">Apellidos:</span></label>
                        <input name="apellidos" type="text" class="form-control" placeholder="Apellidos" value="<%=apellidos%>">
                        <label class="form-label"><span class="colorUsername2"> Calle:</span></label>
                        <input name="domicilio" type="text" class="form-control" placeholder="Calle" value="<%=domicilio%>">
                        <label class="form-label"><span class="colorUsername2" > CP:</span></label>
                        <input name="cp" type="text" class="form-control" placeholder="Correo" value="<%=cp%>"><br>
                        <div class="button-container carrito" >                           
                            <button type="submit" class="boton-carrito">Guardar Datos Modificados</button>
                        </div>	
                    </form>
                        <div class="button-container carrito" >                           
                            <button class="boton-carrito" onclick="window.location.href='pedidos.jsp';">Ver Pedidos</button>
                            <form method="post" action="CerrarSesion.html">
                                <button type="submit" class="boton-carrito">Cerrar sesion</button>
                            </form>
                        </div>	
                </div>
                <div class="col-sm-6" id="FotoPerfil">
                    <img src="Imagenes/foto-perfil.jpg" alt="FotoPerfil" style="width: 300px;">
                </div>
            </div>
        </div>
        <br><br><br><br>
        <mi-pie></mi-pie>
        <script src="./js/mis-etiquetas.js"></script>
	</body>
</html>

