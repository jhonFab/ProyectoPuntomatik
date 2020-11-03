<%-- 
    Document   : consultarPuntos
    Created on : 02-nov-2020, 21:36:04
    Author     : leonardo
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
        <title>Consultar Saldo de putos</title>
        
    </head>
    <body>
         <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            
        %>

        <h1 style="text-align: center;" class="container mt-5 ">Consulta los puntos del conductor</h1>
        
         <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedulaBuscarPunto" class="form-control mr-sm-2"  id="cedulaBuscarPunto" placeholder="numero de cedula del ciudadano del que se desea ver los puntos." >
                </div>

                <button type="submit" name="buscarPuntos" class="btn btn-primary">Buscar</button>
            </form>

        </div>
        
         <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">cedula conductor</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">puntos</th>
                    
                </tr>
            </thead>
            <tbody>
                <%            
                    if (request.getParameter("buscar") != null) {
                    String cedulaBuscarPunto = request.getParameter("cedulaBuscarPunto");
                        try {
                     
                            String url = "jdbc:mysql://localhost:3306/software";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");

                            con = DriverManager.getConnection(url, username, password);
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT c.id_conductor, c.nombre, c.puntos FROM `conductor` c WHERE c.id_conductor =cedulaBuscarPunto");

                            while (rs.next()) {
                            

                %>
                <tr>
                    <th scope="row"> <%= rs.getInt(1)%> </th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3) %></td>
                   
                </tr>
                <%
                    }

                } catch (Exception e) {%>
            <div class="alert alert-danger" role="alert"><%
                        out.print("Alerta: Campos vacios");
                    }
                }
                %></div>
        </tbody>
    </table>
        
         <div class="container mt-5 ">
        <button type="submit" class="btn btn-light "><a href="index.jsp"><i class="fa fa-reply" aria-hidden="true">Regresar a Pagina Principal</i></a></button>
    </div>
        
    </body>
</html>
