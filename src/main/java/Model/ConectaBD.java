/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.esto es una
 */
package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLDataException;
import java.sql.SQLException;
import static java.time.Clock.system;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jflinaresa@uqvirtual 
 * @autor juan
 */
public class ConectaBD {
    public static Connection con;
    public static String driver = "com.mysql.jdbc.Driver";
    public static String usuario = "root";
    public static String passw = "";
    public static String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    
    public ConectaBD(){
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,usuario,passw);
            
            if(con != null){
                System.out.println("Conexion OK "+con);
            }
            
            
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error en la conexion..."+e.getMessage());
        }
    }
    
    public Connection conectar(){
        return con;
    }
    public void desconectar(){
        System.out.println("Cerrando la BD "+con);
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error de SQL "+ex.getMessage());
        }
    }
}
