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
        <title>Historial De Infracciones Del Conductor</title>
    </head>
    <body class="p-3 mb-2 btn-light text-black">

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String nombre = null;
            String cedula = null;
            String fecha = null;
            String lugar = null;
            String idvehiculo = null;
            String tipovehiculo = null;
            String placa = null;
            String idinfraccion = null;
            String gravedad = null;
            String detalle = null;

            String verificar = null;
        %>

        <h1>Historial Conductores</h1>

        <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedulaBuscar" class="form-control mr-sm-2"  aria-describedby="emailHelp" >
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </form>

        </div>




        <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Cedula</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Lugar</th>
                    <th scope="col">ID Vehiculo</th>
                    <th scope="col">Placa Vehiculo</th>
                    <th scope="col">Tipo Vehiculo</th>
                    <th scope="col">ID Infraccion</th>
                    <th scope="col">Gravedad</th>
                    <th scope="col">Detalle</th>
                </tr>
            </thead>
            <tbody>
                <%            String cedulaBuscar = request.getParameter("cedulaBuscar");
                    if (request.getParameter("buscar") != null) {
                        try {

                            String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection(url, username, password);

                            st = con.createStatement();
                            rs = st.executeQuery("SELECT c.id_conductor, c.nombre, m.fecha, m.lugar, v.id_vehiculo, v.placa, v.tipo_vehiculo, i.id_infraccion, i.gravedad, i.detalle FROM conductor c,multa m, infraccion i, vehiculo v WHERE c.id_conductor=" + cedulaBuscar + " AND m.id_conductor=" + cedulaBuscar + " AND m.id_infraccion=i.id_infraccion AND c.id_vehiculo=v.id_vehiculo");
                            
                            while (rs.next()) {

                                

                %>
                <tr>
                    <th scope="row"> <%= rs.getString(1)%> </th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                    <td><%= rs.getString(10)%></td>
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
