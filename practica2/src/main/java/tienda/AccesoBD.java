package tienda;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
//import java.util.LinkedList;


public final class AccesoBD {
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;

	public static AccesoBD getInstance() {
		if (instanciaUnica == null) {
			instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}

	private AccesoBD() {
		abrirConexionBD();
	}

	public void abrirConexionBD() {
		if (conexionBD == null)
		{
			String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
			// daw es el nombre de la base de datos que hemos creado con anterioridad.
			String DB_URL = "jdbc:mariadb://localhost:3306/daw2";
			// El usuario root y su clave son los que se puso al instalar MariaDB.
			String USER = "root";
			String PASS = "JoanGiron123";
			try {
				Class.forName(JDBC_DRIVER);
				conexionBD = DriverManager.getConnection(DB_URL,USER,PASS);
			}
			catch(Exception e) {
				System.err.println("No se ha podido conectar a la base de datos.....");
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}

	public boolean comprobarAcceso() {
		abrirConexionBD();
		return (conexionBD != null);
	}

	public List<ProductoBD> obtenerProductosBD() {
		abrirConexionBD();
	
		ArrayList<ProductoBD> productos = new ArrayList<>();
	
		try {
			String con = "SELECT codigo,descripcion,precio,existencias,imagen FROM productos";
			Statement s = conexionBD.createStatement();
			ResultSet resultado = s.executeQuery(con);
			while(resultado.next()){
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(resultado.getInt("codigo"));
				producto.setStock(resultado.getInt("existencias"));
				if(producto.getStock() > 0)
				{
					producto.setDescripcion(resultado.getString("descripcion"));
					producto.setPrecio(resultado.getFloat("precio"));
					producto.setImagen(resultado.getString("imagen"));
					productos.add(producto);
				}
			}
		}
		catch(Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
	
		return productos;
	}


	public Usuario obtenerUsuarioVentaBD(String sessionUser) {
		abrirConexionBD();
		Usuario user = new Usuario(); 
	
		try {
			String con = "SELECT  usuario, codigo, nombre, domicilio, cp, apellidos FROM usuarios";
			Statement s = conexionBD.createStatement();
			ResultSet resultado = s.executeQuery(con);
			while (resultado.next()) {
				String code = String.valueOf(resultado.getInt("codigo"));				
				if (sessionUser.equals(code)) {
					user.setUsuario(resultado.getString("usuario"));
					user.setCodigo(resultado.getInt("codigo"));
					user.setNombre(resultado.getString("nombre"));
					user.setDomicilio(resultado.getString("domicilio")); 
					user.setCP(resultado.getString("cp")); 
					user.setApellidos(resultado.getString("apellidos"));
					break; 
				}
			}
		} catch (Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
	
		return user; // Retorna el usuario encontrado o null si no se encontró
	}
	

	public int comprobarUsuarioBD(String usuario, String clave) {
		abrirConexionBD();
	
		int codigo = -1;
	
		try{
			String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1,usuario);
			s.setString(2,clave);
	
			ResultSet resultado = s.executeQuery();
	
			// El usuario/clave se encuentra en la BD
	
			if ( resultado.next() ) {
				codigo =  resultado.getInt("codigo");
			}
		}
		catch(Exception e) {
	
			// Error en la conexión con la BD
			System.err.println("Error verificando usuario/clave");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	
		return codigo;
	}

	public void CrearUsuario(String usuario, String clave, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String tlf){
		abrirConexionBD();

		try{
			// Comienza por obtener el máximo código existente
			String queryMaxCodigo = "SELECT MAX(codigo) FROM usuarios";
			PreparedStatement stmtMaxCodigo = conexionBD.prepareStatement(queryMaxCodigo);
			ResultSet rs = stmtMaxCodigo.executeQuery();
			int maxCodigo = 0;
			if (rs.next()) {
				maxCodigo = rs.getInt(1); // Obtiene el máximo código
			}
			maxCodigo++; // Incrementa para el nuevo usuario

			String con = "INSERT INTO usuarios (usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, activo, admin, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1,usuario);
			s.setString(2,clave);
			s.setString(3,nombre);
			s.setString(4,apellidos);
			s.setString(5,domicilio);
			s.setString(6,poblacion);
			s.setString(7,provincia);
			s.setString(8,cp);
			s.setInt(9,1);
			s.setInt(10,1);
			s.setString(11,tlf);

			s.executeUpdate();
		}
		catch(Exception e) {
			// Error en la conexión con la BD
			System.err.println("Error introduciendo info de usuario");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

	public void ModificarUsuario(String codigo, String usuario, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp){
		abrirConexionBD();
	
		try{
			// Asegúrate de que los parámetros de la consulta coincidan con los campos correctos que quieres actualizar
			String con = "UPDATE usuarios SET usuario = ?, nombre = ?, apellidos = ?, domicilio = ?, poblacion = ?, provincia = ?, cp = ? WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(con);
	
			// Configura los parámetros para la consulta UPDATE
			s.setString(1, usuario);
			s.setString(2, nombre);
			s.setString(3, apellidos);
			s.setString(4, domicilio);
			s.setString(5, poblacion);
			s.setString(6, provincia);
			s.setString(7, cp);
			s.setString(8, codigo);  // La cláusula WHERE utiliza el código para identificar el registro a actualizar
	
			int filasAfectadas = s.executeUpdate();
			
			if (filasAfectadas > 0) {
				System.out.println("El usuario con código " + codigo + " ha sido actualizado correctamente.");
			} else {
				System.out.println("No se encontró un usuario con el código especificado para actualizar.");
			}
		}
		catch(Exception e) {
			// Error en la conexión con la BD o en la ejecución de la consulta
			System.err.println("Error modificando la información del usuario");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

	public void CrearPedido(List<Producto> productos, int persona, String fecha, float importe, int estado) {
		abrirConexionBD();
		int maxCodigo = 0;
	
		try {
			String queryMaxCodigo = "SELECT MAX(codigo) FROM pedidos";
			PreparedStatement stmtMaxCodigo = conexionBD.prepareStatement(queryMaxCodigo);
			ResultSet rs = stmtMaxCodigo.executeQuery();
			if (rs.next()) {
				maxCodigo = rs.getInt(1) + 1; // Obtiene el máximo código y lo incrementa para el nuevo pedido
			}
	
			// Inserta el nuevo pedido
			String con = "INSERT INTO pedidos (codigo, persona, fecha, importe, estado) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setInt(1, maxCodigo);
			s.setInt(2, persona);
			s.setString(3, fecha);
			s.setFloat(4, importe);
			s.setInt(5, estado);
	
			int filasAfectadas = s.executeUpdate();
	
			if (filasAfectadas > 0) {
				CrearDetallesPedido(productos, maxCodigo);
				ActualizarAlmacen(productos);
			} else {
				System.err.println("No se pudo insertar el pedido.");
			}
		} catch (Exception e) {
			System.err.println("Error introduciendo info de pedido");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

	public void ActualizarAlmacen(List<Producto> productos) {
		abrirConexionBD();
		
		try {
			String con = "UPDATE productos SET existencias = existencias - ? WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(con);
	
			for (Producto producto : productos) {

				s.setInt(1, producto.getCantidad());  
				s.setInt(2, producto.getCodigo());   
	
				// Ejecutar la actualización
				int filasAfectadas = s.executeUpdate();
				if (filasAfectadas > 0) {
					System.out.println("Existencias actualizadas para el producto código: " + producto.getCodigo());
				} else {
					System.out.println("No se encontró un producto con el código: " + producto.getCodigo() + " o no se necesitó actualizar existencias.");
				}
			}
		} catch (SQLException e) {
			System.err.println("Error actualizando las existencias en la base de datos");
			System.err.println(e.getMessage());
			e.printStackTrace();
		} 
	}
	

	public void CrearDetallesPedido(List<Producto> productos, int numPedido) {
		abrirConexionBD();
	
		try {
			String con = "INSERT INTO detalle (codigo_pedido, codigo_producto, unidades, precio_unitario) VALUES (?, ?, ?, ?)";
			
			// Prepara una declaración una sola vez
			PreparedStatement s = conexionBD.prepareStatement(con);
	
			for (int i = 0; i < productos.size(); i++) {
				Producto producto = productos.get(i); 
				s.setInt(1, numPedido);
				s.setInt(2, producto.getCodigo());   
				s.setInt(3, producto.getCantidad());
				s.setFloat(4, producto.getPrecio());
	
				s.executeUpdate();
			}
		} catch (Exception e) {
			System.err.println("Error introduciendo info de pedido");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	

	public int ComprobarCantidad(int codigo, int cantidad){
		abrirConexionBD();

		int noProduct = 0;
		ProductoBD prod = new ProductoBD();
		
		try{
			String con = "SELECT codigo, existencias FROM productos";
			Statement s = conexionBD.createStatement();
			ResultSet resultado = s.executeQuery(con);
			while (resultado.next()) {
				prod.setCodigo(resultado.getInt("codigo"));		
				if (prod.getCodigo() == codigo) {
					prod.setStock(resultado.getInt("existencias"));
					if(prod.getStock() >= cantidad)
					{
						return cantidad;
					}
					else{
						return cantidad = prod.getStock();
					}
				}
			}
		}
		catch(Exception e) {
			// Error en la conexión con la BD
			System.err.println("Error introduciendo info de usuario");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}

		return noProduct;
	}


public List<Pedido> obtenerPedidosBD(int usuarioRegistrado) {
	abrirConexionBD();

	ArrayList<Pedido> pedidos = new ArrayList<>();

	try {
		String con = "SELECT codigo,persona,fecha,importe,estado FROM pedidos";
		Statement s = conexionBD.createStatement();
		ResultSet resultado = s.executeQuery(con);

		while(resultado.next()){
			Pedido pedido = new Pedido();
			pedido.setCodigo(resultado.getInt("codigo"));
			pedido.setPersona(resultado.getInt("persona"));
			if(pedido.getPersona() == usuarioRegistrado)
			{
				pedido.setFecha(resultado.getString("fecha"));
				pedido.setImporte(resultado.getFloat("importe"));
				pedido.setEstado(resultado.getInt("estado"));
				pedidos.add(pedido);			
			}
		}
	}
	catch(Exception e) {
		System.err.println("Error ejecutando la consulta a la base de datos");
		System.err.println(e.getMessage());
	}

	return pedidos;
	}

	public void EliminarPedido(int codigopedido) {
		abrirConexionBD(); // Asumo que esta función abre la conexión con la base de datos.
	
		try {
			String query = "UPDATE pedidos SET estado = 2 WHERE codigo = ?";	
			PreparedStatement stmt = conexionBD.prepareStatement(query);
			

			stmt.setInt(1, codigopedido);
	
			int count = stmt.executeUpdate();
	
			if (count > 0) {
				System.out.println("Pedido eliminado con éxito.");
			} else {
				System.out.println("No se encontró un pedido con el código especificado.");
			}
		} catch (SQLException e) {
			System.err.println("Error ejecutando la operación de eliminar en la base de datos");
			System.err.println(e.getMessage());
		}
	
	}

	public List<Detalle> DetallesPedido(int codigoUsuario, int codigoPedido) {
		abrirConexionBD(); // Asume que esta función abre la conexión con la base de datos.
		List<Detalle> detalles = new ArrayList<>();
	
		try {
			String con = "SELECT d.codigo_pedido, d.codigo_producto, d.unidades, d.precio_unitario " + 
						 "FROM pedidos p JOIN detalle d ON p.codigo = d.codigo_pedido " +
						 "WHERE p.codigo = ? AND p.persona = ?";
						 
			PreparedStatement stmt = conexionBD.prepareStatement(con);
			stmt.setInt(1, codigoPedido);
			stmt.setInt(2, codigoUsuario);
			ResultSet resultado = stmt.executeQuery();
	
			while(resultado.next()){
				Detalle detalle = new Detalle();
				detalle.setCodigoPedido(resultado.getInt("codigo_pedido"));
				detalle.setCodigoProducto(resultado.getInt("codigo_producto"));
				detalle.setUnidades(resultado.getInt("unidades"));
				detalle.setPrecioProducto(resultado.getFloat("precio_unitario"));
				detalles.add(detalle);
			}
		} catch (SQLException e) {
			System.err.println("Error ejecutando la consulta en la base de datos");
			System.err.println(e.getMessage());
		}
	
		return detalles;
	}
	
	public String TraduccionTablaEstados(int estado) {
		abrirConexionBD();
	
		String estadoDescripcion = "";
	
		try {
			// Consulta para obtener la descripción del estado basado en el código de estado proporcionado
			String sql = "SELECT descripcion FROM estados WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(sql);
			s.setInt(1, estado); // Establece el código de estado en la consulta
			ResultSet rs = s.executeQuery();
	
			// Si hay un resultado, obtiene la descripción del estado
			if (rs.next()) {
				estadoDescripcion = rs.getString("descripcion");
			} else {
				estadoDescripcion = "Estado no encontrado"; // Mensaje de retorno en caso de que no exista el estado
			}
		} catch (SQLException e) {
			System.err.println("Error ejecutando la consulta en la base de datos");
			System.err.println(e.getMessage());
			e.printStackTrace();

		}
		return estadoDescripcion;
	}
}