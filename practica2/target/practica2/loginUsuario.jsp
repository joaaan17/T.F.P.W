<%@page language="java" contentType="text/html charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>

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
		<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </head>
	<body style="background-color: #212529;">
    <mi-menu2></mi-menu2>
    <%-- Utilizamos una variable en la sesión para informar de los mensajes de Error --%>
	<%
	String mensaje = (String)session.getAttribute("mensaje");

	if (mensaje != null) {
	%>
	<%-- Eliminamos el mensaje consumido --%>
	<%
		session.removeAttribute("mensaje");
	%>
	<p style="color: aliceblue; font-family: Roboto Condensed; text-align: center; position: relative; top: 400px"> <%=mensaje%> </p>
	<%
	}
	%>

    <%-- Si no hay usuario o el usuario no es válido --%>

	<%
	if ((session.getAttribute("usuario") == null) ||
	    ((Integer)session.getAttribute("usuario") <=0 ))
	{
	%>
	
	<%-- Mostramos el formulario para la introducción del usuario y la clave --%>
    <form method="post" action="login.html">
		<input type="hidden" name="url" value="UserPerfil.jsp"> 
		<div class="container-fluid">
			<div>
				<h4 style="color: aliceblue; font-family: Roboto Condensed; text-align: center; position: relative; top:10px;">ATENTICACIÓN PARA USUARIOS</h4>			
			</div>
			<div class="container RecPerfil">
					<div class="mb-3 mt-3">
					  <label for="uname" class="form-label"><span class="colorUsername"> Username:</span></label>
					  <input type="text" class="form-control" id="uname" placeholder="Enter username" name="usuario" required>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="mb-3">
					  <label for="pwd" class="form-label"><span class="colorUsername"> Password:</span></label>
					  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="clave" required>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-check mb-3">
					  <input class="form-check-input" type="checkbox" id="myCheck" name="remember" required>
					  <label class="form-check-label" for="myCheck">I agree on blabla.</label>
					  <div class="valid-feedback">Valid.</div>
					  <div class="invalid-feedback">Check this checkbox to continue.</div>
					</div>
					<button type="submit" class="btn btn-outline-secondary">Submit</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='registro.html';">Registrarse</button>
					<br><br>		
				</div>
		</div>
    </form>
	<% } else {
		response.sendRedirect("UserPerfil.jsp");
	} %>
		<mi-pie style="position: relative; top: 500px;"></mi-pie>
		<script src="./js/mis-etiquetas.js"></script>
	</body>
</html>