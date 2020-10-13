<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear conductor</title>
    </head>
    <body>
        <h1 class="text-center mt-5">Registrar conductor</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="crearConductor.jsp" method="post">
                       
                         <div class="form-group">
                            <label for="id_conductor">Cedula</label>
                            <input type="number" class="form-control" id="id_conductor" name="id_conductor" placeholder="Cedula" required="required">
                        </div>
                         <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                       
                         <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" required="required">
                        </div>
                        
                        <div class="form-group">
                            <label for="licencia">Licencia</label>
                            <input type="text" class="form-control" id="numLicencia" name="numLicencia" placeholder="numero de licencia" required="required">
                        </div>
                        <div class="form-group">
                            <label for="id vehiculo">Seleccione id del vehiculo</label>
                          <!--  <input type="number" class="form-control" id="infraccion" name="infraccion" placeholder="infraccion" required="required">-->
                              <select id="seleccion"  onchange="obtenerDato();">
                                    <option>Seleccione la infraccion</option>
                                    <%     
                    
                           try {

                                            String url1 = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                                            String username1 = "root";
                                            String password1 = "";
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con1= DriverManager.getConnection(url1, username1, password1);
                                            st1 = con.createStatement();
                                            rs1 = st1.executeQuery("SELECT id_vehiculo FROM `vehiculo`");
                                            while (rs1.next()) {
                                    %>


                                    <option ><%= rs1.getInt(1)%></option>


                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print("Error Mysql" + e);
                                        }
                                    %>

                                </select>
                                 <input type="number" class="form-control"  id="id_vehiculo" name="id_vehiculo" placeholder="" required="required" readonly="readonly">

                                <script>
                                    function obtenerDato2() {

                                        var d= document.getElementById("seleccion").value;

                                        document.getElementById("id_vehiculo" ).value = d;
                                    }
                                    
                             
                           
                                                           </script>
                        </div>
                        <div class="form-group">
                            <label for="Puntos">seccional</label>
                            <input type="number" class="form-control" id="num_puntos" name="num_puntos" placeholder="numero de puntos">
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
                String cedula= request.getParameter("id_conductor");
                String nombre = request.getParameter("nombre");                             
                String telefono = request.getParameter("telefono");
                String licencia= request.getParameter("numLicencia");
                String idV= request.getParameter("id_vehiculo");
                String numP= request.getParameter("num_puntos");
                

                try {
                    Connection con=null;
                    Statement st=null;
                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);           
                   
                    st=con.createStatement();
                    st.executeUpdate("insert into `vehiculo` (id_conductor,nombre,telefono,licencia,id_vehiculo,puntos ) values("+cedula+",'"+nombre+"','"+telefono+"','"+licencia+"',"+idV+","+numP+");");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error  : "+e);
                }

            }
        %>
    </body>
</html>
