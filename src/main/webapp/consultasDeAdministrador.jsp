<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>Busqueda</title>
    </head>
    <body class="p-3 mb-2 btn-light text-black">

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            String cedula = null;
            String nombre = null;
            String telefono = null;
            String usuario = null;
            String contrasena = null;
            String seccional = null;

        %>

        <h1>historial de Infracciones</h1>     
        <div class="container mt-5 ">
            <form class="form-group">
               


                <button type="submit" name="buscar" class="btn btn-primary">Generar Historial </button>
                 <button type="submit" name="buscar" class="btn btn-primary">Generar Total </button>

            </form>

        </div>

        <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>

                    <th scope="col">Agente</th>
                    <th scope="col">infraccion</th>
                    <th scope="col">desc. Puntos</th>
                    <th scope="col">Valor multa</th>

                </tr>
            </thead>
            <tbody>




                <%            String cedulaBuscar = request.getParameter("seleccion");
                    if (request.getParameter("buscar") =="") {
                        try {

                            String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection(url, username, password);

                            st = con.createStatement();

                           rs = st.executeQuery("SELECT `id_agente` FROM `agente` ");
                           int id= rs.getByte(1);

                            while (rs.next()) {
                              

                %>
                <tr>
                    <th scope="row"> <%= rs.getString(1)%> </th>
                


                </tr>
                <%  }
                } catch (Exception e) {%>
            <div class="alert alert-danger" role="alert"><%
                out.print("Alerta : ingrese un dato");
                %></div>

            <%
                    }
                }
            %>
        </tbody>

        <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>

                    <th scope="col">Total Descuento de puntos</th>
                    <th scope="col">Total Multas</th>


                </tr>
            </thead>

            <tbody>
                <%
                    if (request.getParameter("buscarPuntos") != null) {
                        String cedulaBuscarPunto = request.getParameter("cedulaBuscarPunto");
                        try {

                            String url = "jdbc:mysql://localhost:3306/software";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");

                            con = DriverManager.getConnection(url, username, password);
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT SUM(valor) FROM infraccion INNER JOIN multa WHERE multa.id_agente = " + cedulaBuscar + " ");

                            while (rs.next()) {


                %>
                <tr>
                    <th scope="row"> <%= rs.getInt(1)%> </th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>

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
             <a href="index.jsp"><i class="fa fa-reply" aria-hidden="true"></i></a>  
        </div>


</body>
</html>
