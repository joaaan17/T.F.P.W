<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>

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
		<input type="hidden" name="url" value="resguardo.jsp">
		<%
		String dirEntrega = "";
		String cp = "";
		String usuarioRegistrado="";

		if (session == null || session.getAttribute("usuario") == null) {
			response.sendRedirect("loginUsuario.jsp");
			return;
		}
		
		usuarioRegistrado = String.valueOf(session.getAttribute("usuario"));
		if (usuarioRegistrado != null) {
			AccesoBD con=AccesoBD.getInstance();
			Usuario user = con.obtenerUsuarioVentaBD(usuarioRegistrado);
			
			if (user != null) { // Asegúrate de que user no es null
				dirEntrega = user.getDomicilio();
				cp = user.getCP();
			}
		}
	%>

	<%
	// Obtener la lista de productos finales del atributo de la solicitud
	List<Producto> listaProductosFinales = (List<Producto>) session.getAttribute("productosFinales");
	String nombre = "";
	float precio = 0;
	int cantidad = 0;
	float precioFinal = 0;
	%>

	<form method="post" action="Tramitacion.html">
		<input type="hidden" name="url" value="GraciasPorComprar.html">
			<div class="container-fluid">
				<div>
					<h4 style="color: aliceblue; font-family: Roboto Condensed; text-align: center; position: relative; top:10px;">FINALIZAR TU COMPRA</h4>			
				</div>
				<div class="container RecPerfil">
						<div class="mb-3 mt-3">
							<label for="uname" class="form-label"><span class="colorUsername"> Dirección:</span></label>
							<input type="text" class="form-control" id="uname" placeholder="Direccion de entrega" name="direccion" value="<%=dirEntrega%>" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="mb-3">
							<label for="pwd" class="form-label"><span class="colorUsername"> CP</span></label>
							<input type="text" class="form-control" id="pwd" placeholder="Codigo postal" name="cp" value="<%=cp%>" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="mb-3">
							<label for="pwd" class="form-label"><span class="colorUsername"> Método de pago</span></label>
							<div class="btn-group btn-group-sm">
								<button type="button" class="btn btn-outline-secondary">Efectivo</button>
								<button type="button" class="btn btn-outline-secondary">Tarjeta</button>
								<button type="button" class="btn btn-outline-secondary">Contra reenbolso</button>
							</div>
						</div>
						<div>
						<div class="row">
							<div class="col-1 d-flex justify-content-center align-items-center" style="font-size: 15px;">
								<p class="textAdmin">NOMBRE</p>
							</div>
							<div class="col-1 d-flex justify-content-center align-items-center">
												
							</div>
							<div class="col-4 d-flex justify-content-center align-items-center">
								<p class="textAdmin">PRECIO</p>
							</div>
							<div class="col-3 d-flex justify-content-center align-items-center">
								<p class="textAdmin">CANTIDAD</p>
							</div>
							<div class="col-3 d-flex justify-content-center align-items-center"> 
							</div>
						</div>
							<% if (listaProductosFinales != null) {
								for (Producto producto : listaProductosFinales) { 
									nombre = producto.getNombre(); 
									precio = producto.getPrecio();
									cantidad =  producto.getCantidad();
									precioFinal += precio*cantidad;
									%>
									
									<div class="container resguardo" style="color:#212529; position: relative;top: 15px;">
										<input type="hidden" name="codigo" value="UserPerfil.html"> 
										<div class="row">
											<div class="col-1 d-flex justify-content-center align-items-center">
												<p class="textResguardo"> <%= nombre %></p>
											</div>
											<div class="col-1 d-flex justify-content-center align-items-center">
												
											</div>
											<div class="col-4 d-flex justify-content-center align-items-center">
												<p class="textResguardo"><%= precio %></p>
											</div>
											<div class="col-3 d-flex justify-content-center align-items-center">
												<p class="textResguardo"> <%= cantidad %></p>
											</div>
											<div class="col-3 d-flex justify-content-center align-items-center"> 
											</div>
										</div>
									</div>									
								<% }
							} %>
						</div>
						<div class="row">
							<div class="col-12 d-flex justify-content-center align-items-center">
								<h3 class="textResguardo">EL PRECIO TOTAL ES: <%=precioFinal%> €</h3>
							</div>
						</div>
						<input type="hidden" name="nombreUsuPedido" value="<%= usuarioRegistrado %>">
						<input type="hidden" name="fechaPedido" value="2022-12-29">
						<input type="hidden" name="importePedido" value="<%= precioFinal %>">
						<input type="hidden" name="estadoPedido" value="1">

						<button type="submit" class="btn btn-outline-secondary">Comprar</button>
						
						<br><br>		
					</div>
			</div>
		</form>
		<button class="btn btn-outline-secondary" style="position: relative; left: 40px;" onclick="window.location.href='empresa1.html';">Cancelar</button>

		<mi-pie style="position: relative; top: 50px;"></mi-pie>
		<script src="./js/mis-etiquetas.js"></script>
	</body>
</html>