package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

public class Tramitacion extends HttpServlet{
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true); 
        int persona = Integer.parseInt(request.getParameter("nombreUsuPedido"));       
        String fecha = request.getParameter("fechaPedido"); 
        float importe = Float.parseFloat(request.getParameter("importePedido"));
        int estado = Integer.parseInt(request.getParameter("estadoPedido"));
        List<Producto> productos = new ArrayList<Producto>();
        productos = (List<Producto>) session.getAttribute("productosFinales");

        // URL a la que debemos volver
        String url = request.getParameter("url"); 
    
        AccesoBD con = AccesoBD.getInstance(); 
        
        con.CrearPedido(productos, persona, fecha, importe, estado);

        request.getRequestDispatcher(url).forward(request, response);
    }
}
