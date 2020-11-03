/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.GestorBD;
import Model.Agente;
import Model.Conductor;
import Model.ConectaBD;
import Model.Infraccion;
import Model.Multa;
import Model.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jflin
 */
@WebServlet(name = "consulta", urlPatterns = {"/consulta"})
public class consulta extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op;
        op = (request.getParameter("op") != null) ? request.getParameter("op") : "list";
        
        ArrayList lista = new ArrayList();
        
        ConectaBD canal = new ConectaBD();
        Connection con = canal.conectar();
        PreparedStatement ps;
        ResultSet rs;
        
        if(op.equals("list")){
            
            try {
                String sql = "SELECT c.id_conductor, c.nombre, m.fecha, m.lugar, v.id_vehiculo, v.placa, v.tipo_vehiculo, i.id_infraccion, i.gravedad, i.detalle FROM conductor c,multa m, infraccion i, vehiculo v WHERE c.id_conductor=\" + cedulaBuscar + \" AND m.id_conductor=\" + cedulaBuscar + \" AND m.id_infraccion=i.id_infraccion AND c.id_vehiculo=v.id_vehiculo";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    Conductor c = new Conductor();
                    Vehiculo v = new Vehiculo();
                    Infraccion i = new Infraccion();
                    Multa m = new Multa();
                    
                    c.setId_conductor(rs.getInt("id_conductor"));
                    c.setNombre(rs.getString("nombre"));
                    m.setFecha(rs.getString("fecha"));
                    m.setLugar(rs.getString("lugar"));
                    v.setId_vehiculo(rs.getInt("id_vehiculo"));
                    v.setPlaca(rs.getString("placa"));
                    v.setTipo_vehiculo(rs.getString("tipo_vehiculo"));
                    i.setId_infraccion(rs.getInt("id_infraccion"));
                    i.setGravedad(rs.getString("gravedad"));
                    i.setDetalle(rs.getString("detalle"));
                    
                    lista.add(c);
                    lista.add(m);
                    lista.add(v);
                    lista.add(i);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("historialConductor.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println("Error de SQL "+ex.getMessage());
            } finally{
                canal.desconectar();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
