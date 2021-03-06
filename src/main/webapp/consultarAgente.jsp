
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="Productos/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Lista Agentes</title>
    </head>
    <body  style="background-image: url('https://besthqwallpapers.com/img/original/99458/blue-creative-texture-dark-blue-abstract-background-creative-blue-backgrounds-background-with-lines-stylish-blue-texture.jpg');">
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
        <form class="datosHisConductores">
            <h1>Listado de Agentes</h1>
            <div class="container mt-5 ">

                <div class="row">
                    <div class="col-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"  colspan="4" class="text-center">Agentes</th>
                                    <th scope="col" colspan="3" > 
                                        <a href="crearAgente.jsp"><i class="fa fa-user-plus" aria-hidden="true"> Add</i></a>                                
                                    </th>   

                                </tr>
                                <tr>                          
                                    <th scope="col">Cedula</th>
                                    <th scope="col">Nombre</th>                    
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Usuario</th>
                                    <th scope="col">Contrasena</th>
                                    <th scope="col">seccional</th>
                                    <th scope="col">Acciones</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%                                try {

                                        String url = "jdbc:mysql://localhost:3306/software";
                                        String username = "root";
                                        String password = "";
                                        Class.forName("com.mysql.jdbc.Driver");

                                        con = DriverManager.getConnection(url, username, password);
                                        st = con.createStatement();
                                        rs = st.executeQuery("SELECT * FROM `agente`");
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <th scope="row"> <%= rs.getInt(1)%> </th>
                                    <td><%= rs.getString(2)%></td>
                                    <td><%= rs.getString(3)%></td>
                                    <td><%= rs.getString(4)%></td>
                                    <td><%= rs.getString(5)%></td>
                                    <td><%= rs.getInt(6)%></td>
                                    <td> 
                                        <a href="editarAgente.jsp?id_agente=<%= rs.getInt(1)%> &nombre=<%= rs.getString(2)%> &telefono=<%= rs.getString(3)%> &usuario=<%= rs.getString(4)%> &contrasena=<%= rs.getString(5)%> &id_seccional=<%= rs.getInt(6)%>" ><i class="fa fa-pencil" aria-hidden="true"> Editar</i></a>
                                        <a href="eliminarAgente.jsp?id_agente=<%= rs.getInt(1)%> " class="ml-3"><i class="fa fa-trash-o" aria-hidden="true">Eliminar</i></a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        out.print("Error Mysql" + e);
                                    }
                                %>
                            </tbody>
                        </table>
                        <button   type="submit" class="btn btn-light"><a href="index.jsp">Regresar pagina Principal</button></a>
                        <th scope="col"> 
                            <a href="index.jsp"><i class="fa fa-reply" aria-hidden="true"></i></a>                                
                        </th>  
                    </div>
                </div>
            </div>
                                <div class="container mt-5  "style="text-align: center"> 
        <button type="submit" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true" ></i><a href="mostrarAgente.jsp">Buscar por Cedula</button>
    </div>
        </form>
    </body>    
</html>
