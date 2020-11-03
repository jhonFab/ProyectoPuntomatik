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
    private String usuario;
    private String contrasena;
    private int id_seccional;
    
    public Agente(int cedula, String nombre, String telefono, String usua, String contra, int seccional){
            this.id_agente = cedula;
            this.nombre= nombre; 
            this.telefono= telefono;
            this.usuario= usua;
            this.contrasena= contra;
            this.id_seccional= seccional;
    
    }

    public int getId_agente() {
        return id_agente;
    }

    public void setId_agente(int id_agente) {
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

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getId_seccional() {
        return id_seccional;
    }

    public void setId_seccional(int id_seccional) {
        this.id_seccional = id_seccional;
    }

   
}
