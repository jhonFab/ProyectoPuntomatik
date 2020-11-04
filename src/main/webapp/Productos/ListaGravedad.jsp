<%-- 
    Document   : index
    Created on : 2 nov. 2020, 11:33:01
    Author     : jflin
--%>

<%@page import="Model.GravedadPDAO"%>
<%@page import="Model.GravedadP"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Gravedad</title>
    </head>
    <body class="p-3 mb-2 btn-light text-center" >
        <h1>Lista Gravedad multas</h1>
       
        <br/><br/>
        <table  class="table table-striped" width="80%">
            <thead>
                 <tr>
                                <th scope="col"  colspan="2" class="text-center">Gravedad</th>
                                <th scope="col"  colspan="2" class="text-center"><a href="ControladorGravedad?accion=nuevo"><i class="fa fa-user-plus" aria-hidden="true"> Add</i></a>                                
                                </th>   

                            </tr>
                <tr>
                    
                     
                                <th scope="col">Id</th>                    
                                <th scope="col">Tipo Gravedad</th>
                                <th scope="col"></th>
                                <th scope="col"></th>

                </tr>
            </thead>
            <%    GravedadPDAO g = new GravedadPDAO();
                List<GravedadP> lista = g.listarGravedad();
                Iterator<GravedadP> iter = lista.iterator();
                GravedadP pro = null;
                while (iter.hasNext()) {
                    pro = iter.next();


            %>
            <tbody>

                <tr>
                    <td><%=pro.getId_gravedad()%></td>
                    <td><%=pro.getGravedad() %></td>                                   
                    <td><a href="ControladorGravedad?accion=eliminar&id_gravedad=<%= pro.getId_gravedad()%> " class="ml-3"><i class="fa fa-trash-o" aria-hidden="true">Eliminar</i></a></td>
                    <td><a href="ControladorGravedad?accion=modificar&id_gravedad=<%= pro.getId_gravedad()%>&tipo_gravedad=<%= pro.getGravedad() %>" class="ml-3"><i class="fa fa-pencil" aria-hidden="true">Modificar</i></a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
             <a href=" ">Regresar Principal</a>
    
    </body>
</html>
