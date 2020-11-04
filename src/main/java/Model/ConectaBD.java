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

    public static Connection abrir() {
        System.out.println("Conexion exitosa");
        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(url, usuario, passw);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexion ");
        }
        return con;
    }

    public static void cerrar() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("error en la conexion no se logro cerrar " + e);
        }
    }

    

}
