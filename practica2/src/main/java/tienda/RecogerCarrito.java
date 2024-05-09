package tienda;

import jakarta.json.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;


public class RecogerCarrito extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        ArrayList<Producto> carritoJSON = new ArrayList<Producto>();
        HttpSession session = request.getSession(true); 
        int cantidadStock;

        AccesoBD con = AccesoBD.getInstance();

    
            JsonReader jsonReader = Json.createReader(new InputStreamReader(request.getInputStream(), "utf-8"));
            JsonArray jobj = jsonReader.readArray();

            // Procesar los productos del carrito
            for (int i = 0; i < jobj.size(); i++){
                JsonObject prod = jobj.getJsonObject(i);
                Producto nuevo = new Producto();

                nuevo.setCodigo(prod.getInt("codigo"));
                nuevo.setCantidad(prod.getInt("cantidad"));
                cantidadStock = con.ComprobarCantidad(nuevo.getCodigo(), nuevo.getCantidad());

                if(cantidadStock > 0){
                    nuevo.setCantidad(cantidadStock);
                    nuevo.setNombre(prod.getString("nombre"));
                    nuevo.setPrecio(Float.parseFloat(prod.get("precio").toString()));
                    carritoJSON.add(nuevo);
                }
            }
        
        session.setAttribute("productosFinales", carritoJSON);
        request.getRequestDispatcher("resguardo.jsp").forward(request, response); //response
    }
}

