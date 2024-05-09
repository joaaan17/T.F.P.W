package tienda;

import jakarta.servlet.http.HttpServlet;

public class Pedido extends HttpServlet{
    
    private int codigo;
    private int persona;
    private String fecha;
    private float importe;
    private int estado;

    public void setCodigo(int codigo){
        this.codigo = codigo;
    }

    public int getCodigo(){
        return codigo;
    }

    public void setPersona(int persona){
        this.persona = persona;
    }

    public int getPersona(){
        return persona;
    }

    public void setFecha(String fecha){
        this.fecha = fecha;
    }

    public String getFecha(){
        return fecha;
    }

    public void setImporte(float importe){
        this.importe = importe;
    }

    public float getImporte(){
        return importe;
    }

    public void setEstado(int estado){
        this.estado = estado;
    }

    public int getEstado(){
        return estado;
    }
    
}
