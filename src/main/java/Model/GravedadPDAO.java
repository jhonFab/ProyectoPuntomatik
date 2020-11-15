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
import java.util.List;

/**
 *
 * @author jflin
 */
public class GravedadPDAO {
    static Connection con=null;
    
    public GravedadPDAO(){
    ConectaBD cn= new ConectaBD();
    con= ConectaBD.abrir();
    }
    
      public List<GravedadP> listarGravedad() {

        //PreparableStatement ps;
        ResultSet rs;
        Statement st;
        List<GravedadP> lista = new ArrayList<>();
        try {
            con = ConectaBD.abrir();
            st = con.createStatement();
            // ps=(PreparableStatement) con.prepareStatement("SELECT id,codigo,nombre,precio,existencia FROM `productos`");
            rs = st.executeQuery("SELECT tipo_gravedad,id_gravedad  FROM `gravedad`");
            while (rs.next()) {
                int id_gravedad= rs.getInt("id_gravedad");
                String tipo = rs.getString("tipo_gravedad");
                GravedadP gravedad = new GravedadP(id_gravedad, tipo);
                lista.add(gravedad);

            }
            return lista;

        } catch (SQLException r) {
            System.out.println(r.toString());
            return null;
        }
    }
      
       public static GravedadP mostrarGravedad(int id_gravedad) {
        //PreparableStatement ps;
        ResultSet rs;
        Statement st;
        GravedadP gravedad = null;
        try {
            con = ConectaBD.abrir();
            st = con.createStatement();
            // ps=(PreparableStatement) con.prepareStatement("SELECT id,codigo,nombre,precio,existencia FROM `productos`");
            rs = st.executeQuery("SELECT tipo_gravedad,id_gravedad  FROM `gravedad` where id="+id_gravedad+"");
      
            while (rs.next()) {
                int id = rs.getInt("id_gravedad");
                String tipo = rs.getString("tipo_gravedad");
                

                gravedad= new GravedadP(id, tipo);

            }
            return gravedad;

        } catch (SQLException r) {
            System.out.println(r.toString());
            return null;
        }
    }
       
         public boolean insertarGravead(GravedadP gravedad) {

        Statement st;
        String dato = "insert into `gravedad` (tipo_gravedad,id_gravedad) values('" + gravedad.getGravedad()+ "'," + gravedad.getId_gravedad() + ");";
      
        try {
            con = ConectaBD.abrir();
            st = con.createStatement();
            st.executeUpdate(dato);
            return true;

        } catch (SQLException r) {
            System.out.println(r.toString());
            return false;

        }
    }
    public boolean actualizarGravedad(GravedadP gravedad) {

        Statement st;
        String dato = "update `gravedad`  set tipo_gravedad='" + gravedad.getGravedad()+"',id_gravedad=" + gravedad.getId_gravedad()+" where id_gravedad="+gravedad.getId_gravedad()+" ";
        
        try {                                                                                                                                      
            con = ConectaBD.abrir();
            st = con.createStatement();
            st.executeUpdate(dato);
            return true;

        } catch (SQLException r) {
            System.out.println(r.toString());
            return false;

        }
    }
    public boolean eliminarGravedad(int _id) {

        Statement st;
        String dato = "delete from `gravedad` where id_gravedad="+_id+" ";
        try {
            con = ConectaBD.abrir();
            st = con.createStatement();
            st.executeUpdate(dato);
            return true;

        } catch (SQLException r) {
            System.out.println(r.toString());
            return false;

        }
    }
    
}
