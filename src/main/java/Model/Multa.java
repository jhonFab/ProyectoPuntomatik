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
public class Multa {
    private int id_multa;
    private int id_agente;
    private int id_conductor;
    private int id_vehiculo;
    private int id_infraccion;
    private String fecha;
    private String lugar;

    public Multa() {
        this.id_multa = 0;
        this.id_agente = 0;
        this.id_conductor = 0;
        this.id_vehiculo = 0;
        this.id_infraccion = 0;
        this.fecha = "";
        this.lugar = "";
    }

    public int getId_multa() {
        return id_multa;
    }

    public void setId_multa(int id_multa) {
        this.id_multa = id_multa;
    }

    public int getId_agente() {
        return id_agente;
    }

    public void setId_agente(int id_agente) {
        this.id_agente = id_agente;
    }

    public int getId_conductor() {
        return id_conductor;
    }

    public void setId_conductor(int id_conductor) {
        this.id_conductor = id_conductor;
    }

    public int getId_vehiculo() {
        return id_vehiculo;
    }

    public void setId_vehiculo(int id_vehiculo) {
        this.id_vehiculo = id_vehiculo;
    }

    public int getId_infraccion() {
        return id_infraccion;
    }

    public void setId_infraccion(int id_infraccion) {
        this.id_infraccion = id_infraccion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    
}
