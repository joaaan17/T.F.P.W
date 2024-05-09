package tienda;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DetallesPedido extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Detalle> detalles = new ArrayList<Detalle>();

        AccesoBD con = AccesoBD.getInstance();
        
        String strCodigousuario = request.getParameter("codigousuario");
        String strCodigopedido = request.getParameter("codigopedido");
    
        int codigousuario;
        int codigopedido;
    
        try {
            codigousuario = Integer.parseInt(strCodigousuario);
            codigopedido = Integer.parseInt(strCodigopedido);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Código de usuario o código de pedido no válidos");
            return;
        }
        
        detalles = con.DetallesPedido(codigousuario, codigopedido);
        request.setAttribute("detalles", detalles); 
        request.getRequestDispatcher("DetallesPedido.jsp").forward(request, response);
    }
    
}
