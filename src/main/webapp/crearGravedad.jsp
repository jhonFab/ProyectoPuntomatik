<%-- 
    Document   : crearGravedad
    Created on : 23 oct. 2020, 23:45:22
    Author     : jflin
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear gravedad</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
        <h1 class="text-center mt-5">Registrar  Gravedad</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="crearGravedad.jsp" method="post">

                        <div class="form-group">
                            <label for="tipo_gravedad">Tipo de Gravedad</label>
                            <input type="text" class="form-control" id="tipo_gravedad" name="tipo_gravedad" placeholder="tipo de garvedad" required="required">
                        </div>
                        <div class="form-group">
                            <label for="id_gravead">id gravedad</label>
                            <input type="number" class="form-control" id="id_gravedad" name="id_gravedad" placeholder="" required="required">

                             <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                                         <a href="index.jsp">Cancelar  <i class="fa fa-times" aria-hidden="true"></i></a>            

                    </form>
                                      

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String tipoGravedad= request.getParameter("tipo_gravedad");
                String idGravedad= request.getParameter("id_gravedad ");
                
                
                try {

                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);

                    st = con.createStatement();
                    st.executeUpdate("insert into `gravedad` (tipo_gravedad,id_gravedad) values('" + tipoGravedad + "'," + idGravedad+ ");");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error acceso BD : " + e);
                }
            }
        %>
    </body>
</html>
