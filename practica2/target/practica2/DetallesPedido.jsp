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
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

		<link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
	</head>
	<body style="background-color: #212529;">
        <%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("loginUsuario.jsp");
        return;
    }
    
    List<Detalle> detalles = (List<Detalle>) request.getAttribute("detalles");
    %>

		<mi-menu2></mi-menu2>
        <div class="container-fluid" style="position: relative; top:10px;">
            <div class="container" style="position: relative;top: 15px;">
                <div class="row">
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">CODIGO PEDIDO</p>
                    </div>
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">CODIGO PRODUCTO</p>
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">UNIDADES</p>
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center">
                        <p class="textAdmin">PRECIO</p>
                    </div>
                        <div class="col-3 d-flex justify-content-center align-items-center"> 
                    </div>
                </div>
            </div>
                <div class="container containerAdmin" style="margin-top:0px;">
                    <div class="row">
                        <% if (detalles == null || detalles.isEmpty()) { %>
                            <div class="row">
                                <div class="col-lg-12">
                                    No hay pedidos disponibles.
                                </div>
                            </div>
                        <% } else { %>
                            <% for (Detalle detalle : detalles) { 
                                int codigo = detalle.getCodigoPedido();
                                int codigoprod = detalle.getCodigoProducto(); 
                                int unidades = detalle.getUnidades();
                                float importe = detalle.getPrecioProducto(); 
                            %>
                            <div class="container containerAdmin" style="margin-top:0px;">
                                <div class="row">
                                    <div class="col-1 d-flex justify-content-center align-items-center">
                                        <p class="textAdmin2" name="codigopedido"><%= codigo %></p>
                                    </div>
                                    <div class="col-2 d-flex justify-content-center align-items-center">
                                        <p class="textAdmin2"><%= codigoprod %></p>
                                    </div>
                                    <div class="col-3 d-flex justify-content-center align-items-center">
                                        <p class="textAdmin2"><%= unidades %></p>
                                    </div>
                                    <div class="col-3 d-flex justify-content-center align-items-center">
                                        <p class="textAdmin2"><%= importe %></p>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                                        
                        <% } %>
                    </div>
                </div>
                
        <br><br>
        <mi-pie></mi-pie>
		<script src="./js/mis-etiquetas.js"></script>
	</body>
</html>



