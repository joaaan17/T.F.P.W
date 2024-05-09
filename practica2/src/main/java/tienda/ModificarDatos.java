package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModificarDatos extends HttpServlet{
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String usuario = request.getParameter("usuario");  
        String nombre = request.getParameter("nombre"); 
        String apellidos = request.getParameter("apellidos"); 
        String domicilio = request.getParameter("domicilio"); 
        String poblacion = request.getParameter("poblacion"); 
        String provincia = request.getParameter("provincia"); 
        String codigo = request.getParameter("codigo"); 
        String cp = request.getParameter("cp"); 
    
        // URL a la que debemos volver
        String url = request.getParameter("url"); 

    
        AccesoBD con = AccesoBD.getInstance(); 
    
        if ((usuario != null)) {
            con.ModificarUsuario(codigo, usuario,  nombre, apellidos, domicilio, poblacion, provincia, cp);
        }

        request.getRequestDispatcher(url).forward(request, response);
    }
}
