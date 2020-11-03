<%-- 
    Document   : consultaProductividadAgente
    Created on : 17 oct. 2020, 23:59:44
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
        <title>Consultar Productividad de Agente</title>
    </head>
    <body>

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            
        %>

        <h1 style="text-align: center;" class="container mt-5 ">Consultar Productividad de Agente de Transito</h1>

        <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedulaBuscar" class="form-control mr-sm-2"  id="cedulaBuscar" placeholder="cedulaBuscar" >
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </form>

        </div>
        <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id Agente</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Lugar</th>
                    <th scope="col">ID Infraccion</th>
                    <th scope="col">Gravedad</th>
                    <th scope="col">Detalle</th>
                </tr>
            </thead>
            <tbody>
                <%            
                    if (request.getParameter("buscar") != null) {
                    String cedulaBuscar = request.getParameter("cedulaBuscar");
                        try {
                        System.out.println("pasa");
                            String url = "jdbc:mysql://localhost:3306/software";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");

                            con = DriverManager.getConnection(url, username, password);
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT a.id_agente, a.nombre, m.fecha, m.lugar, i.id_infraccion, g.tipo_gravedad, i.detalle FROM `agente` a, `multa` m, `infraccion` i, `gravedad` g WHERE a.id_agente="+cedulaBuscar+ " AND m.id_agente="+cedulaBuscar +" AND m.id_infraccion=i.id_infraccion AND i.id_gravedad=g.id_gravedad");

                            while (rs.next()) {
                            

                %>
                <tr>
                    <th scope="row"> <%= rs.getInt(1)%> </th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getInt(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
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
        <button type="submit" class="btn btn-light "><a href="index.jsp"><i class="fa fa-reply" aria-hidden="true">Regresar Pagina Principal</i></a></button>
    </div>
</body>
</html>