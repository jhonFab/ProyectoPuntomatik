<%-- 
    Document   : index
    Created on : 19 sep. 2020, 20:14:21
    Author     : jflin
--%>

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
        <title>Lista conductores</title>
    </head>
    
    <body class="p-3 mb-2 btn-light text-black" >
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>


        <h1>Listado de Conductores</h1>
     

        <div class="container mt-5 ">
            <nav class="navbar navbar-light">
  <a class="navbar-brand">Conductores</a>
  <form class="form-inline">
      <a><i class="fa fa-user-circle-o" aria-hidden="true" ></i></a>
    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
  </form>
</nav>
            
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"  colspan="4" class="text-center">Conductores</th>
                                <th scope="col"> 
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"> Add</i></a>                                
                                </th>   
                        
                        </tr>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Cedula</th>
                            <th scope="col">Email</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Contrasena</th>
                            <th scope="col">Acciones</th>                                
                        </tr>
                        </thead>
                        <tbody>
                            <%                                try {

                                    String url = "jdbc:mysql://localhost:3306/prueba";
                                    String username = "root";
                                    String password = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, username, password);
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `agente`");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"> <%= rs.getString(1)%> </th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><%= rs.getString(6)%></td>
                                <td> 
                                    <a href="editar.jsp?nombre=<%= rs.getString(1)%> &cedula=<%= rs.getString(2)%> &email=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>&usuario=<%= rs.getString(5)%> &contrasena=<%= rs.getString(6)%>   " ><i class="fa fa-pencil" aria-hidden="true"> Editar</i></a>
                                    <a href="eliminar.jsp?cedula=<%= rs.getString(2)%> " class="ml-3"><i class="fa fa-trash-o" aria-hidden="true">Eliminar</i></a>
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

                    <button   type="submit" class="btn btn-light">Regresar pagina Principal</button>
                    <th scope="col"> 
                        <a href="index.jsp"><i class="fa fa-reply" aria-hidden="true"></i></a>                                
                    </th>  
                </div>
            </div>
        </div>
    </body>
</html>
