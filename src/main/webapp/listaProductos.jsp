<%-- 
    Document   : listaProductos
    Created on : 19 sep. 2020, 20:13:18
    Author     : jflin
--%>


<%@page import="Model.Producto" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            ArrayList<Producto> productos = null;
            productos = (ArrayList<Producto>) request.getAttribute("Productos");
        %>
        <table border>
            <tr>
                <th> Id  Producto</th>
                 <th> Nombre Producto</th>
                  <th>precio</th>
                   <th>cantidad</th>                
            </tr>
            <% for (Producto producto : productos) { %>
            <tr valign="rigth">
                <td><%=producto.getClave()%></td>
                <td><%=producto.getNombre()%></td>
                <td><%=producto.getPrecio()%></td>
                <td><%=producto.getCantidad()%></td>                
            </tr>
            <% } %>            
            </table>
            <form action="index.jp" method="post">
                <input type="submit" value="Regresar">                  
            </form>
    </body>
</html>
