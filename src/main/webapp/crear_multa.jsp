<%-- 
    Document   : crearInfraccion
    Created on : 10/10/2020, 07:06:33 p. m.
    Author     : Juan David Castaño
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
        <title>Crear agente</title>
    </head>
    <body>
        <h1 class="text-center mt-5">Registrar multa</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="crear_multa.jsp" method="post">
                       
                        <div class="form-group">
                            <label for="id_agente">id agente</label>
                            <input type="number" class="form-control" id="id_agente" name="id_agente" placeholder="Cedula" required="required">
                        </div>
                        <div class="form-group">
                            <label for="id_conductor">id conductor</label>
                            <input type="number" class="form-control" id="id_conductor" name="id_conductor" placeholder="id conductor" required="required">
                        </div>
                        <div class="form-group">
                            <label for="placa">placa vehiculo</label>
                            <input type="text" class="form-control" id="placa" name="placa1" placeholder="Placa" required="required">
                        </div>
                        
                        <div class="form-group">
                            <label for="infraccion">id infracción</label>
                            <input type="number" class="form-control" id="infraccion" name="infraccion" placeholder="infraccion" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fecha">fecha</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" placeholder="fecha" required="required">
                        </div>
                        <div class="form-group">
                            <label for="lugar">lugar</label>
                            <input type="text" class="form-control" id="lugar" name="lugar" placeholder="lugar">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <button type="submit" name="enviar" class="btn btn-primary"> Cancelar  <i class="fa fa-times" aria-hidden="true"></i>
</button>
                       

                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") !=null) {
                //String multa= request.getParameter("id_multa");
                String cedula= request.getParameter("id_agente");
                String cedula2 = request.getParameter("id_conductor");                             
                String placaVehiculo = request.getParameter("placa1");
                String id_infraccion= request.getParameter("infraccion");
                String fecha= request.getParameter("fecha");
                String ubicacion= request.getParameter("lugar");
      
                

                try {
                    Connection con=null;
                    Statement st=null;
                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);           
                   
                    st=con.createStatement();
                    st.executeUpdate("insert into `multa` (id_agente,id_conductor,id_vehiculo,id_infraccion,fecha,lugar ) values("+cedula+","+cedula2+",'"+placaVehiculo+"',"+id_infraccion+",'"+fecha+"','"+ubicacion+"');");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error  : "+e);
                }

            }
        %>
    </body>
</html>
