<%-- 
    Document   : historialConductor
    Created on : 6 oct. 2020, 23:18:09
    Author     : JUAN MORENO
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
        <title>Historial Conductores</title>
    </head>
    <body class="p-3 mb-2 btn-light text-black">

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;


        %>

        <h1>Historial Conductores</h1>

        <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Cedula</label>
                    <input type="text" name="cedula" class="form-control mr-sm-2"  aria-describedby="emailHelp">
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </form>

        </div>

        <div class="row ">
            <div class="col-sm container mt-5">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Cedula</th>
                            <th scope="col">ID Agente</th>
                            <th scope="col">Puntos</th>
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
                                rs = st.executeQuery("SELECT a.cedula, a.nombre, c.id, c.puntos FROM `agente` AS a INNER JOIN `infraccion` AS c WHERE a.cedula=c.id");

                                while (rs.next()) {

                        %>
                        <tr>
                            <th scope="row"><%= rs.getString("cedula")%></th>
                            <td><%= rs.getString("nombre")%></td>
                            <td><%= rs.getString("id")%></td>
                            <td><%= rs.getString("puntos")%></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.print("Error Mysql" + e);
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
