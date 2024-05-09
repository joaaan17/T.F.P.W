package tienda;

import jakarta.servlet.http.HttpServlet;

public class Usuario extends HttpServlet{

    private int codigo;
	private String usuario;
	private String  nombre;
    private String  apellidos;
	private String domicilio;
    private String cp;

    public int getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public String getUsuario() {
        return usuario;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDomicilio() {
        return domicilio;
    }
    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public void setCP(String cp){
        this.cp = cp;
    }

    public String getCP(){
        return cp;
    }

    public String getApellidos() {
        return apellidos;
    }
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
}
