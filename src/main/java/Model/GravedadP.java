/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author jflin
 */
public class GravedadP {
     private int id_gravedad;
    private String gravedad;

    public GravedadP(int id_gravedad, String gravedad) {
        this.id_gravedad = id_gravedad;
        this.gravedad = gravedad;
    }

    public int getId_gravedad() {
        return id_gravedad;
    }

    public void setId_gravedad(int id_gravedad) {
        this.id_gravedad = id_gravedad;
    }

    public String getGravedad() {
        return gravedad;
    }

    public void setGravedad(String gravedad) {
        this.gravedad = gravedad;
    }
    
    
}
