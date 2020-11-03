/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author JUAN MORENO
 */
public class Infraccion {
    private int id_infraccion; 
    private String gravedad;
    private String detalle;
    private int valor;

    public Infraccion() {
        this.id_infraccion = 0;
        this.gravedad = "";
        this.detalle = "";
        this.valor = 0;
    }

    public int getId_infraccion() {
        return id_infraccion;
    }

    public void setId_infraccion(int id_infraccion) {
        this.id_infraccion = id_infraccion;
    }

    public String getGravedad() {
        return gravedad;
    }

    public void setGravedad(String gravedad) {
        this.gravedad = gravedad;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
}
