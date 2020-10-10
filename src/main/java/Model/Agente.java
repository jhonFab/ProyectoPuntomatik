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
public class Agente implements Serializable{ 
    private int id_agente; 
    private String nombre;
    private  String telefono;
    private int usuario;
    private int contrasena;
    private String seccional;
    
    public Agente(int cedula, String nom, String telefono, int usua, int contra, String seccio){
            this.id_agente = cedula;
            this.nombre= nom; 
            this.telefono= telefono;
            this.usuario=usua;
            this.contrasena=contra;
            this.seccional=seccio;
    
    }

    public int getId_agente() {
        return id_agente;
    }

    public void setAgente(int id_agente ) {
        this.id_agente = id_agente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }
    
    public int getContrasena() {
        return contrasena;
    }

    public void setContrasena(int contrasena) {
        this.contrasena = contrasena;
    }
    
    public void setSeccional(String seccional) {
        this.seccional = seccional;
    }

    public String getSeccional() {
        return seccional;
    }
}
