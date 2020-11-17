/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.GravedadP;
import Model.GravedadPDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jflin
 */
@WebServlet(name = "ControladorGravedad", urlPatterns = {"/ControladorGravedad"})
public class ControladorGravedad extends HttpServlet {

   
   

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GravedadPDAO gravedadDAO= new GravedadPDAO();
        String accion;
        RequestDispatcher dispacher = null;

        accion = request.getParameter("accion");
        
        if (accion == null || accion.isEmpty()) {
            dispacher = request.getRequestDispatcher("inicioDti.jsp");
            List<GravedadP> listaGravedad = gravedadDAO.listarGravedad();
            request.setAttribute("lista", listaGravedad);
        } else if ("nuevo".equalsIgnoreCase(accion)) {
            dispacher = request.getRequestDispatcher("agregarGravedad.jsp");
        } else if ("insertar".equalsIgnoreCase(accion)) {
            String tipo = request.getParameter("tipo_gravedad");
            int id = Integer.parseInt(request.getParameter("id_gravedad"));
            GravedadP g = new GravedadP(id, tipo);
            gravedadDAO.insertarGravead(g);

            dispacher = request.getRequestDispatcher("inicioDti.jsp");
        } else if ("modificar".equalsIgnoreCase(accion)) {

            int id = Integer.parseInt(request.getParameter("id_gravedad"));
            GravedadP g = gravedadDAO.mostrarGravedad(id);
            request.setAttribute("lista", g);
            dispacher = request.getRequestDispatcher("editarGravedad.jsp");
            //  dispacher = request.getRequestDispatcher("/index.jsp");
        } else if ("actualizar".equalsIgnoreCase(accion)) {
            int id = Integer.parseInt(request.getParameter("id_gravedad"));
            String tipo = request.getParameter("tipo_gravedad");
            GravedadP g = new GravedadP(id, tipo);
            gravedadDAO.actualizarGravedad(g);
            dispacher = request.getRequestDispatcher("ListaGravedad.jsp");
        }else if("eliminar".equalsIgnoreCase(accion)){
            int id= Integer.parseInt(request.getParameter("id_gravedad"));
           gravedadDAO.eliminarGravedad(id);   
            dispacher = request.getRequestDispatcher("ListaGravedad.jsp");
               List<GravedadP> listaGravedad = gravedadDAO.listarGravedad();
           // request.setAttribute("lista", listaProductos);
            //dispacher = request.getRequestDispatcher("/index.jsp");
        }else if(accion.equalsIgnoreCase("listar")){
             dispacher = request.getRequestDispatcher("ListaGravedad.jsp");
               List<GravedadP> listaGravedad = gravedadDAO.listarGravedad();
            request.setAttribute("lista", listaGravedad);
        
        }else{
            dispacher = request.getRequestDispatcher("inicioDti.jsp");
            List<GravedadP> listaGravedad = gravedadDAO.listarGravedad();
            request.setAttribute("lista", listaGravedad);
        }
        dispacher.forward(request, response);

   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          doGet(request, response);
      
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
