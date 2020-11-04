

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

        <h1>Busqueda de agentes</h1>     
           <div class="container mt-5 ">
            <form class="form-group">
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedulaBuscar" class="form-control mr-sm-2"  aria-describedby="emailHelp">
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </form>

        </div>



        <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>
                   
                    <th scope="col">Nombre</th>
                    <th scope="col">Telefono</th>
                    <th scope="col">ID</th>
                    <th scope="col">Seccional</th>
                    
                </tr>
            </thead>
            <tbody>
                <%            String cedulaBuscar = request.getParameter("cedulaBuscar");
                    if (request.getParameter("buscar") != null) {
                        try {

                            String url = "jdbc:mysql://localhost:3306/software";
                            String username = "root";
                            String password = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection(url, username, password);

                            st = con.createStatement();
                            
                            rs = st.executeQuery("SELECT `nombre`,`telefono`,`id_agente`,`id_seccional` FROM `agente` WHERE id_agente="+ cedulaBuscar + " ");
                            while (rs.next()) {
                             
                            

                %>
                <tr>
                    <th scope="row"> <%= rs.getString(1)%> </th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getInt(3)%></td>
                    <td><%= rs.getInt(4)%></td>
                    
                  
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
        </table>

            <div class="container mt-5 ">
                <button type="submit" class="btn btn-light "><a href="index.jsp"><i class="fa fa-reply" aria-hidden="true">Regresar Pagina Principal</i></a></button>
            </div>


    </body>
</html>
