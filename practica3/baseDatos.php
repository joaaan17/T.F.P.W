<?php

function conectar() {
   $bbdd = mysqli_connect("localhost","root","JoanGiron123","daw2");
   if (mysqli_connect_error()) {
      printf("Error conectando a la base de datos: %s\n",mysqli_connect_error());
      exit();
   }
   return $bbdd;
}

function desconectar($bbdd) {
   mysqli_close($bbdd);
}

function obtenerProductos() {
   $bbdd = conectar();
   $consulta = "SELECT * FROM productos";
   $resultado = mysqli_query($bbdd,$consulta);
   desconectar($bbdd);
   return $resultado;
}

function obtenerPedidos() {
    $bbdd = conectar();
    $consulta = "SELECT * FROM pedidos";
    $resultado = mysqli_query($bbdd,$consulta);
    desconectar($bbdd);
    return $resultado;
 }

 function obtenerUsuarios() {
    $bbdd = conectar();
    $consulta = "SELECT * FROM usuarios";
    $resultado = mysqli_query($bbdd,$consulta);
    desconectar($bbdd);
    return $resultado;
 }

 function traducirEstados($estado){
    $bbdd = conectar();
    $consulta = "SELECT descripcion FROM estados WHERE codigo = ?";
    $stmt = mysqli_prepare($bbdd, $consulta); 
    
    if ($stmt === false) {
        // Error al preparar la consulta
        printf("Error en mysqli_prepare: %s\n", mysqli_error($bbdd));
        desconectar($bbdd);
        return null;
    }

    mysqli_stmt_bind_param($stmt, 's', $estado); 
    mysqli_stmt_execute($stmt); 

    mysqli_stmt_bind_result($stmt, $descripcion); 
    $resultado = null;
    if (mysqli_stmt_fetch($stmt)) { 
        $resultado = $descripcion;
    }

    mysqli_stmt_free_result($stmt); 
    mysqli_stmt_close($stmt); 
    desconectar($bbdd); 

    return $resultado;
}


function comprobarUsuario($usuario, $clave) {
    session_start();

    $bbdd = conectar();

    if ($stmt = mysqli_prepare($bbdd, "SELECT codigo, admin FROM usuarios WHERE usuario=? AND clave=?")) {
        mysqli_stmt_bind_param($stmt, 'ss', $usuario, $clave); 
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) > 0) {
            mysqli_stmt_bind_result($stmt, $codigo, $admin); 
            mysqli_stmt_fetch($stmt); 

            if ($admin == 1) { 
                printf("Usuario es administrador.\n");
                $_SESSION['usuario'] = $usuario;  
                $_SESSION['logueado'] = true;
                $_SESSION['admin'] = true; 
            } else {
                printf("Usuario no es administrador.\n");
                $_SESSION['logueado'] = false;
            }
        } else {
            printf("No se encontraron filas con ese usuario y clave.\n");
        }

        mysqli_stmt_free_result($stmt); 
        mysqli_stmt_close($stmt); 
    } else {
        echo "Error al preparar la sentencia: " . mysqli_error($bbdd);
    }

    desconectar($bbdd); 

}

function darDeBaja($usuario) {
    $bbdd = conectar();

    // Preparar la sentencia directamente para actualizar el estado activo a 0
    if ($stmt = mysqli_prepare($bbdd, "UPDATE usuarios SET activo=0 WHERE codigo=?")) {
        mysqli_stmt_bind_param($stmt, 's', $usuario); // Vincular el parámetro 'usuario'
        mysqli_stmt_execute($stmt); // Ejecutar la sentencia de actualización

        // Verificar cuántas filas fueron afectadas
        printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
        
        mysqli_stmt_close($stmt); // Cerrar la sentencia
    } else {
        // Manejar el error en caso de que la sentencia no pueda ser preparada
        echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
    }

    desconectar($bbdd); // Desconectar de la base de datos
}

function darDeAlta($usuario) {
    $bbdd = conectar();

    // Preparar la sentencia directamente para actualizar el estado activo a 0
    if ($stmt = mysqli_prepare($bbdd, "UPDATE usuarios SET activo=1 WHERE codigo=?")) {
        mysqli_stmt_bind_param($stmt, 's', $usuario); // Vincular el parámetro 'usuario'
        mysqli_stmt_execute($stmt); // Ejecutar la sentencia de actualización

        // Verificar cuántas filas fueron afectadas
        printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
        
        mysqli_stmt_close($stmt); // Cerrar la sentencia
    } else {
        // Manejar el error en caso de que la sentencia no pueda ser preparada
        echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
    }

    desconectar($bbdd); // Desconectar de la base de datos
}

function ModificarProducto($codigo, $imagen, $descripcion, $existencias, $precio){
    $bbdd = conectar();

    if ($stmt = mysqli_prepare($bbdd, "UPDATE productos SET descripcion=? , imagen=?, precio=?, existencias=?  WHERE codigo=?")) {
        mysqli_stmt_bind_param($stmt, 'ssdii', $descripcion, $imagen, $precio, $existencias, $codigo);       
        mysqli_stmt_execute($stmt); 
        printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
        
        mysqli_stmt_close($stmt); 
    } else {
        
        echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
    }

    desconectar($bbdd);
}

function AnadirProducto($imagen, $descripcion, $existencias, $precio){
    $bbdd = conectar();

    $result = mysqli_query($bbdd, "SELECT MAX(codigo) FROM productos");
    $row = mysqli_fetch_array($result);
    $maxCodigo = $row[0] + 1; // Añadimos uno al máximo código actual

    if ($stmt = mysqli_prepare($bbdd, "INSERT INTO productos (codigo, descripcion, imagen, precio, existencias) VALUES (?, ?, ?, ?, ?)")) {
        mysqli_stmt_bind_param($stmt, 'issdi', $maxCodigo, $descripcion, $imagen, $precio, $existencias);
        mysqli_stmt_execute($stmt); 
        printf("Producto añadido con éxito, código asignado: %d.\n", $maxCodigo);
        
        mysqli_stmt_close($stmt); 
    } else {
        
        echo "Error al preparar la sentencia de inserción: " . mysqli_error($bbdd);
    }

    desconectar($bbdd);
}

function ModificaUsuario($codigo, $usuario, $nombre, $apellidos, $domicilio, $provincia, $telefono, $cp){
    $bbdd = conectar();

    if ($stmt = mysqli_prepare($bbdd, "UPDATE usuarios SET usuario=? , nombre=?, apellidos=?, domicilio=?, provincia=?, telefono=?, cp=?  WHERE codigo=?")) {
        mysqli_stmt_bind_param($stmt, 'sssssisi', $usuario, $nombre, $apellidos, $domicilio, $provincia, $telefono, $cp, $codigo);       
        mysqli_stmt_execute($stmt); 
        printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
        
        mysqli_stmt_close($stmt); 
    } else {
        
        echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
    }

    desconectar($bbdd);
}

function ModificarEstado($codigo, $estado) {
    $bbdd = conectar();

    if($estado == 1){
        if ($stmt = mysqli_prepare($bbdd, "UPDATE pedidos SET estado=3 WHERE codigo=?")) {
            mysqli_stmt_bind_param($stmt, 's', $codigo); // Vincular el parámetro 'usuario'
            mysqli_stmt_execute($stmt); // Ejecutar la sentencia de actualización

            printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
            
            mysqli_stmt_close($stmt); // Cerrar la sentencia
        } else {
            // Manejar el error en caso de que la sentencia no pueda ser preparada
            echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
        }
    }
    if($estado == 3){
        if ($stmt = mysqli_prepare($bbdd, "UPDATE pedidos SET estado=4 WHERE codigo=?")) {
            mysqli_stmt_bind_param($stmt, 's', $codigo); // Vincular el parámetro 'usuario'
            mysqli_stmt_execute($stmt); // Ejecutar la sentencia de actualización

            printf("La selección modificó %d filas.\n", mysqli_stmt_affected_rows($stmt));
            
            mysqli_stmt_close($stmt); // Cerrar la sentencia
        } else {
            // Manejar el error en caso de que la sentencia no pueda ser preparada
            echo "Error al preparar la sentencia de actualización: " . mysqli_error($bbdd);
        }
    }

    desconectar($bbdd); // Desconectar de la base de datos
}
function BuscarPedidosPersona($persona){
    $bbdd = conectar();

    // Corrección en la consulta SQL para seleccionar de la tabla específica
    $consulta = "SELECT * FROM pedidos WHERE persona = ?";
    $stmt = mysqli_prepare($bbdd, $consulta);
    
    if ($stmt === false) {
        // Error al preparar la consulta
        printf("Error en mysqli_prepare: %s\n", mysqli_error($bbdd));
        desconectar($bbdd);
        return null;
    }

    mysqli_stmt_bind_param($stmt, 's', $persona);
    mysqli_stmt_execute($stmt);
    
    $resultado = mysqli_stmt_get_result($stmt);
    if($resultado === false) {
        printf("Error al obtener resultados: %s\n", mysqli_error($bbdd));
        mysqli_stmt_close($stmt);
        desconectar($bbdd);
        return null;
    }

    $pedidos = [];
    while ($fila = mysqli_fetch_assoc($resultado)) {
        $pedidos[] = $fila;
    }

    mysqli_free_result($resultado);
    mysqli_stmt_close($stmt);
    
    desconectar($bbdd);

    return $pedidos;
}


?>