
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
        <link href="Productos/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Busqueda</title>
    </head>
     <body  style="background-image: url('https://besthqwallpapers.com/img/original/99458/blue-creative-texture-dark-blue-abstract-background-creative-blue-backgrounds-background-with-lines-stylish-blue-texture.jpg');">
   
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

       
           <div class="container mt-5 ">
            <form class="datos" class="form-group">
                 <h1>Estado Actual de Infracciones</h1>     
                <div class="form-group">
                    <label for="cedula">Buscar por Cedula</label>
                    <input type="text" name="cedulaBuscar" class="form-control mr-sm-2"  aria-describedby="emailHelp">
                </div>

                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
                 <button type="submit" name="buscar" class="btn btn-primary">Generar Total</button>
                
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
       
            <table class="table table-bordered container mt-5">
            <thead class="thead-dark">
                <tr>
                   
                    <th scope="col">Total Descuento de puntos</th>
                    <th scope="col">Total Multas</th>
                    
                    
                </tr>
            </thead>
    
    </table>
            </form>
                     
        </div>



      

            <div class="container mt-5 ">
                <button type="submit" class="btn btn-light "><a href="index.jsp"><i class="fa fa-reply" aria-hidden="true">Regresar Pagina Principal</i></a></button>
            </div>


    </body>
</html>
