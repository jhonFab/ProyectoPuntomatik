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

            String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("id_conductor");
            String fecha = request.getParameter("fecha");
            String lugar = request.getParameter("lugar");
            String idvehiculo = request.getParameter("id_vehiculo");
            String tipovehiculo = request.getParameter("tipo_vehiculo");
            String placa = request.getParameter("placa");
            String idinfraccion = request.getParameter("id_infraccion");
            String gravedad = request.getParameter("gravedad");
            String detalle = request.getParameter("detalle");
        %>

        <h1>Historial Conductores</h1>

        <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedula" class="form-control mr-sm-2"  aria-describedby="emailHelp">
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </form>

        </div>

        <div class="container mt-5 ">
            <form class="form-group" >
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom01">Cedula</label>
                        <input type="text" class="form-control" id="validationCustom01" name="cedula" value="<%= cedula%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Nombre</label>
                        <input type="text" class="form-control" id="validationCustom02" name="nombre" value="<%= nombre%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom01">Fecha</label>
                        <input type="text" class="form-control" id="validationCustom01" name="fecha" value="<%= fecha%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Lugar</label>
                        <input type="text" class="form-control" id="validationCustom02" name="lugar" value="<%= lugar%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom01">ID Vehiculo</label>
                        <input type="text" class="form-control" id="validationCustom01" name="idvehiculo" value="<%= idvehiculo%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Tipo Vehiculo</label>
                        <input type="text" class="form-control" id="validationCustom02" name="tipovehiculo" value="<%= tipovehiculo%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Placa Vehiculo</label>
                        <input type="text" class="form-control" id="validationCustom02" name="placa" value="<%= placa%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom01">ID Infraccion</label>
                        <input type="text" class="form-control" id="validationCustom01" name="idinfraccion" value="<%= idinfraccion%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Gravedad</label>
                        <input type="text" class="form-control" id="validationCustom02" name="gravedad" value="<%= gravedad%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom01">Detalle</label>
                        <input type="text" class="form-control" id="validationCustom01" name="detalle" value="<%= detalle%>" required>
                    </div>
                </div>
            </form>
        </div>


        <%
            if (request.getParameter("buscar") != null) {
                try {

                    String url = "jdbc:mysql://localhost:3306/software";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);

                    st = con.createStatement();
                    rs = st.executeQuery("SELECT c.id_conductor, c.nombre, m.fecha, m.lugar, v.id_vehiculo, v.placa, v.tipo_vehiculo, i.id_infraccion, i.gravedad, i.detalle FROM conductor c,multa m, infraccion i, vehiculo v WHERE c.id_conductor=" + cedula);


        %>
        <%            } catch (Exception e) {
                    out.print("Error Mysql" + e);
                }
            }
        %>
    </body>
</html>
