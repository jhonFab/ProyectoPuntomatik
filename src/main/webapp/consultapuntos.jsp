<%-- 
    Document   : listaProductos
    Created on : 19 sep. 2020, 20:13:18
    Author     : jflin
--%>


<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Consulta Puntos</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
        <h1 style="text-align: center" class="mt-5"> Consultas Puntos </h1>

        <div>
            <form action="" method="post">
                <fieldset>
                    <legend>Datos personales</legend>
                    <table>
                        <tr>
                            <td align="right">Cedula:</td>
                            <td><input type="text" name="nombre" required autofocus></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit" class="btn btn-light">Consultar</button></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
        <div class="p-3 mb-2 bg-secondary text-white container mt-5 ">
            <form action="app.jsp" method="post">
                <div class="form-group">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Cedula</th>
                                <th scope="col">Email</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Contraseña</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                String url = "jdbc:mysql://localhost:3306/prueba";
                                String username = "root";
                                String password = "";

                                try {
                                    String nombre = "manuela";
                                    int cedula = 1233;
                                    String email = "manu@hotmail.com";
                                    int cel = 1222;
                                    String usu = "jlina";
                                    String pass = "1235";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, username, password);
                                    System.out.println("Connection established" + con);

                                    //PreparedStatement insert=con.prepareStatement(" insert into `conductor` values (  ' "+ nombre + " ' ,"+cedula+ ",' "+ email+ " ' ,"+cel+ ", ' "+usu+ " ',' "+ pass + " '  ) ");
                                    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `conductor`");
                                    rs = pstmt.executeQuery();
                                    while (rs.next()) {

                            %>

                            <tr>
                                <th scope="row"> <%= rs.getString(1)%> </th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><%= rs.getString(6)%></td>

                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error my sql" + e);
                                }
                            %>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-light">Regresar pagina Principal</button>
            </form>

        </div>
    </body>
</html>
