package tienda;

public class Detalle {
    
    private int codigo_pedido;
    private int codigo_producto;
    private int unidades;
    private float precio;

    public int getCodigoPedido(){
        return codigo_pedido;
    }

    public void setCodigoPedido(int codigo_pedido){
        this.codigo_pedido = codigo_pedido;
    }

    public int getCodigoProducto(){
        return codigo_producto;
    }

    public void setCodigoProducto(int codigo_producto){
        this.codigo_producto = codigo_producto;
    }

    public int getUnidades(){
        return unidades;
    }

    public void setUnidades(int unidades){
        this.unidades = unidades;
    }

    public float getPrecioProducto(){
        return precio;
    }

    public void setPrecioProducto(float precio){
        this.precio = precio;
    }
}
