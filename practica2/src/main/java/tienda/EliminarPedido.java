package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class EliminarPedido extends HttpServlet{
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        

        AccesoBD con = AccesoBD.getInstance();

        int codigopedido = Integer.parseInt(request.getParameter("codigopedido"));
        int estadopedido = Integer.parseInt(request.getParameter("estadopedido"));
        
        if(estadopedido == 1)
            con.EliminarPedido(codigopedido);
        
        request.getRequestDispatcher("pedidos.jsp").forward(request, response); //response
    }
}
