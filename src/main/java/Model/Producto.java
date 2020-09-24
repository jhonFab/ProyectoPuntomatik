/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.io.Serializable;

/**
 *
 * @author jflin
 */
public class Producto implements Serializable{ 
    private int clave; 
    private String nombre;
    private  double precio;
    private int cantidad;
    
    public Producto(int clav, String nom, Double precio, int cant){
            this.clave = clav;
            this.nombre= nom; 
            this.precio= precio;
            this.cantidad=cant;
    
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
