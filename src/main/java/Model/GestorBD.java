/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jflin
 */
public class GestorBD {
    private Connection conn;
    
    
      public boolean registrar(int cedula, String nombre, String telefono, int usua, int contra, String seccional) {
        Connection conn = null;
        Statement stm;
        ResultSet rs; 
        int resultUpdate = 0; 
          try {
              conn = ConectaBD.abrir();
              stm = conn.createStatement();
              resultUpdate = stm.executeUpdate("insert into productos values ("+cedula+" ,' "+ nombre + " ' ,"+telefono+","+ usua+","+contra+")");
              if (resultUpdate != 0) {
                  ConectaBD.cerrar();
                  return true;                   
              }else{
                  ConectaBD.cerrar();
                  return false;
              }
          } catch (SQLException e) {
              System.out.println("Error en la base de datos. ");
              return false;
          }
    }

    public Agente consultar(int clave, String nombre) {
         Connection conn = null;
        Statement stm;
        ResultSet rs; 
        int producResSet = 0; 
          try {
              conn = ConectaBD.abrir();
              stm = conn.createStatement();
              ResultSet productResSet = stm.executeQuery("SELET * FROM productos WHERE clave = ' "+clave+" ' and nombre=' "+nombre+"'");
              if (!productResSet.next()) {
                  System.out.println("No se encontro en registro");
                  ConectaBD.cerrar();
                  return null;
                  
              }else{
                  System.out.println("se encontro el registro");
                  int cedula= productResSet.getInt("id_agente");
                  String nom= productResSet.getString("nombre");
                  String telefono= productResSet.getString("telefono");
                  int usua = productResSet.getInt("usuario");
                  int contra = productResSet.getInt("contrasena");
                  String seccional = productResSet.getString("seccional");
                  Agente productHallado = new Agente(cedula, nom, telefono, usua,contra,seccional);
                  ConectaBD.cerrar();
                  return productHallado;
              }
        
    }   catch (SQLException ex) {
              System.out.println("Error en la base de datos");
              return null;
    }
    }

    public ArrayList<Agente> leerTodos() {
      ArrayList<Agente> productos= new ArrayList<Agente>();
      Connection conn = null; 
      Statement stm; 
        try {
            conn = ConectaBD.abrir();
            stm = conn.createStatement();
            ResultSet productResSet= stm.executeQuery("select * from productos");
            if (!productResSet.next()) {
                System.out.println("No se encontraron registros");
                ConectaBD.cerrar();
                return null;                
            }else{
                do{
                   int cedula= productResSet.getInt("id_agente");
                  String nom= productResSet.getString("nombre");
                  String telefono= productResSet.getString("telefono");
                  int usua = productResSet.getInt("usuario");
                  int contra = productResSet.getInt("contrasena");
                  String seccional = productResSet.getString("seccional");
                  Agente productHallado = new Agente(cedula, nom, telefono, usua, contra, seccional);
                 productos.add(productHallado);
                
                }while (productResSet.next());
                ConectaBD.cerrar();
                return productos;
            }
                  
            
        } catch (SQLException e) {
            System.out.println("Error en la base de datos");
            return null;
        }
    }

  
    
}
