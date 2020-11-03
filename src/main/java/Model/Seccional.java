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
public class Seccional {
    private int id_seccional; 
    private String descripcion;

    public Seccional() {
        this.id_seccional = 0;
        this.descripcion = "";
    }

    public int getId_seccional() {
        return id_seccional;
    }

    public void setId_seccional(int id_seccional) {
        this.id_seccional = id_seccional;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
