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
    <body class="p-3" >
        <div class="d-flex" >
            <div class="card col-sm-4">
                <h2>Informacion Gravedad</h2>
                <div class="card_body">
                    <form  action="ControladorGravedad?accion=insertar" method="POST" autocomplete="off">

                        <div class="form-group">
                            <label for="id_gravedad">ID Gravedad</label>
                            <input type="text" class="form-control" id="id_gravedad"  name="id_gravedad" placeholder="tipo de garvedad" required="required">
                        </div>
                        <div class="form-group">
                            <label for="tipo_gravedad">Tipo de Gravedad</label>
                            <input type="text" class="form-control" id="tipo_gravedad" name="tipo_gravedad" placeholder="tipo de garvedad" required="required">
                        </div>

                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <a href="inicioDti.jsp">Cancelar  <i class="fa fa-times" aria-hidden="true"></i></a>  
                    </form>
                </div>
            </div>
            <div class="col-sm-9">
                <table  class="table table-striped" width="80%">
                    <thead>
                    <th scope="col"  colspan="3" class="text-center"></th> 
                    <tr>
                    <h2 class="d-flex"> Lista de Gravedades</h2>
                    <th scope="col">Id</th>                    
                    <th scope="col">Tipo Gravedad</th>
                    <th >Acciones</th>
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
                            <td><%=pro.getGravedad()%></td>                                   
                            <td>
                                <a onclick="javascript:if(!confirm('Esta seguro de eliminar este dato')) return false" href="ControladorGravedad?accion=eliminar&id_gravedad=<%= pro.getId_gravedad()%> " class="ml-3"><i class="fa fa-trash-o" aria-hidden="true">Eliminar</i></a>
                                <a href="ControladorGravedad?accion=modificar&id_gravedad=<%= pro.getId_gravedad()%>&tipo_gravedad=<%= pro.getGravedad()%>" onclick="javascript:if(!confirm('Esta seguro de moficar este dato')) return false"  class="ml-3"><i class="fa fa-pencil" aria-hidden="true">Modificar</i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <a href="inicioDti.jsp">Regresar Principal</a>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
