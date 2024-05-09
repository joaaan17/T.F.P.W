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
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="./js/carrito.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Protest+Guerrilla&display=swap" rel="stylesheet">
    </head>
    <body style="background-color: #212529;">
        
        <%
        AccesoBD con=AccesoBD.getInstance();
        List<ProductoBD> productos = con.obtenerProductosBD();
        int count = 0;
        %>

        <mi-menu2></mi-menu2>
        <div id="contenedorTITContrastes" class="container-fluid">
            <h2 class="titContrastes">#T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W</h2>
            <h2 class="subtitContrastes">#T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W #T.F.P.W</h2>
        </div>
        <div id="fotosContrastesCol" class="container">
            <% if (productos == null || productos.isEmpty()) { %>
                <div class="row">
                    <div class="col-lg-12">
                        No hay productos disponibles.
                    </div>
                </div>
            <% } else { %>
                <div class="row">
                    <% for (ProductoBD producto : productos) {
                        if(count % 3 == 0 && count != 0) { %>
                            </div><div class="row">
                        <% }
                        int codigo = producto.getCodigo();
                        String descripcion = producto.getDescripcion();
                        float precio = producto.getPrecio();
                        int stock = producto.getStock();
                        String imagen = producto.getImagen();
                    %>
                    <div class="col-lg-4">
                        <img class="IMGproducto" src="<%= request.getContextPath() %>/Imagenes/<%= imagen %>" data-producto-id="<%= codigo %>" alt="ImagenCOntrastesUrbanos">
                        <div class="container descripcion-articulos">
                            <div class="row">
                                <div class="col">
                                    <p style="margin-bottom: 0; font-size: 15px;"><%= descripcion %></p>
                                    <p style="position: relative; margin-top: 0%;"><%= precio %> €</p>
                                </div>
                                <div class="col">
                                    <div class="button-container carrito">
                                        <% if (stock > 0) { %>
                                            <input type="button" class="boton-carrito" value="Añadir al carrito" onclick="anadirCarrito('<%= codigo %>', '<%= descripcion %>', '<%= precio %>', 1, 'TALLA XL')">
                                        <% } else { %>
                                            <button disabled class="btn disabled">Agotado</button>
                                        <% } %>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                        count++; // Incrementar el contador después de cada producto
                    } %>
                </div>
            <% } %>
        </div>
        <mi-pie></mi-pie>
        <script src="./js/mis-etiquetas.js"></script>
    </body>
</html>
