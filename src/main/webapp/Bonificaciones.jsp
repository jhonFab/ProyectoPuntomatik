<%-- 
    Document   : Asignar bonificaciones
    Created on : 02 nov. 2020, 16:44:22
    Author     : David
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Productos/estilos.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Busqueda</title>
    </head>
    <body  style="background-image: url('https://besthqwallpapers.com/img/original/99458/blue-creative-texture-dark-blue-abstract-background-creative-blue-backgrounds-background-with-lines-stylish-blue-texture.jpg');">

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            Statement st1 = null;
            ResultSet rs1 = null;
            int puntos = 0;
            Date td = new Date();
            String b = new String("");
            SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd");
            b = format.format(td);


        %>
        
        <div class="d-flex" >
        <div>
            <form class="datos">
                <h1 style="text-align: center;" class="container mt-5 ">Asignar bonificaciones a conductores</h1>     
                <div class="form-group">
                     <label for="cedula">Número de cédula</label>
                    <input type="search" name="cedulaBuscar" placeholder="Introduzca la cedula del conductor" class="form-control mr-sm-2" >
                    <br>
                     <label for="puntos">Cantidad de puntos</label>
                    <input type="text" name="asignarPuntos" class="form-control mr-sm-2" placeholder="Introduzca los puntos a bonificar"  aria-describedby="emailHelp">
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
                <button type="submit" name="asignar" class="btn btn-primary">Asignar</button>

                <table class="table table-bordered container mt-5">
                    <thead class="thead-dark">
                        <tr>

                            <th scope="col">Nombre</th>
                            <th scope="col">Puntos</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% String cedulaBuscar = request.getParameter("cedulaBuscar");
                            if (cedulaBuscar != null) {
                                try {

                                    String url = "jdbc:mysql://localhost:3306/software";
                                    String username = "root";
                                    String password = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, username, password);

                                    st = con.createStatement();
                                    st1 = con.createStatement();

                                    rs = st.executeQuery("SELECT `nombre`, `puntos` FROM `conductor` WHERE id_conductor=" + cedulaBuscar + " ");

                                    while (rs.next()) {

                                        puntos = rs.getInt(2);


                        %>

                        <tr>
                            <th scope="row"> <%= rs.getString(1)%> </th>
                            <td><%= puntos%></td>


                        </tr>

                        <%  }

                            //out.print(cedulaBuscar);
                } catch (Exception e) {%>
                    <div class="alert alert-danger" role="alert"><%
                        out.print("Alerta : ingrese un dato");
                        %></div>

                    <%
                            }

                        }


                    %>
                    </tbody>


                    <tbody>
                        <%                    String asigP = request.getParameter("asignarPuntos");

                            if (request.getParameter("asignar") != null) {

                                int bonificacion = Integer.parseInt(asigP);
                                int puntos1 = puntos + bonificacion;

                                try {

                                    String url = "jdbc:mysql://localhost:3306/software";
                                    String username = "root";
                                    String password = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, username, password);

                                    st1 = con.createStatement();

                                    st1.executeUpdate("UPDATE conductor SET puntos = " + puntos1 + " WHERE id_conductor=" + cedulaBuscar + "");

                                    st.executeUpdate("INSERT INTO `bonificaciones`(`id_conductor`, `puntos` , `fecha`) VALUES (" + cedulaBuscar + "," + bonificacion + ",'" + b + "') ");

                        %>

                        <%                } catch (Exception e) {%>
                    <div class="alert alert-danger" role="alert"><%
                        out.print("Alerta : ingrese un dato");
                        %></div>

                    <%
                            }
                        }


                    %>
                    </tbody>
                </table>
            </form>
                     <div class="container mt-5 ">
                    <button  class="btn btn-light "><a href="inicioDti.jsp"><i class="fa fa-reply" aria-hidden="true">  Regresar Pagina Principal</i></a></button>
                </div>
        </div>
                    
                    </div>
                    

    </body>
</html>
