<%-- 
    Document   : crearInfraccion
    Created on : 10/10/2020, 07:06:33 p. m.
    Author     : Juan David Castaño
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import = "Model.GravedadPDAO"%>
<%@page import = "Model.GravedadP" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Productos/estilos.css" rel="stylesheet" type="text/css"/>
               <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear agente</title>
    </head>
    <body  style="background-image: url('https://besthqwallpapers.com/img/original/99458/blue-creative-texture-dark-blue-abstract-background-creative-blue-backgrounds-background-with-lines-stylish-blue-texture.jpg');">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueo") == null || sesion.getAttribute("logueo").equals("0")) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <%
            Connection con = null;
            Statement st = null;
            Statement st3 = null;
            ResultSet rs = null;
            ResultSet  rs2 = null;
            Date td = new Date(); 
            String b = new String(""); 
            SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd"); 
            b = format.format(td);
            

        %>
       
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form class="datos"  action="crear_multa.jsp" method="post">
                         <h1 class="text-center mt-5">Registrar multa</h1>
        <hr style="width:75%; border-color: blue" >
                       
                        <div class="form-group">
                            <label for="id_agente">Codigo agente</label>
                            <!--<input type="number" class="form-control" id="id_agente" name="id_agente" placeholder="Cedula" required="required">-->
                            <select id="seleccion"  onchange="obtenerDato();">
                                    <option>Seleccione su codigo</option>
                                    <%                                try {

                                            String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                                            String username = "root";
                                            String password = "";
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection(url, username, password);
                                            st = con.createStatement();
                                            rs = st.executeQuery("SELECT * FROM `agente`");
                                            while (rs.next()) {
                                    %>


                                    <option ><%= rs.getInt(1)%></option>
                                    <option  class="form-control" disabled=" "><%= rs.getString(2)%></option>
                                     
                                    <%
                                       
                                        }
                                        } catch (Exception e) {
                                            out.print("Error Mysql" + e);
                                        }
                                    %>

                                </select>
                                   
                                 <input type="text" class="form-control" id="id_agente" name="id_agente" placeholder="" required="required" readonly="readonly">

                                <script>
                                    function obtenerDato() {

                                        var d = document.getElementById("seleccion").value;
                                                
                                        document.getElementById("id_agente").value = d;
                                    }
                                    
                             
                           
                                                           </script>
                        </div>
                        <div class="form-group">
                            <label for="id_conductor">Código conductor</label>
                           <!-- <input type="number" class="form-control" id="id_conductor" name="id_conductor" placeholder="id conductor" required="required">-->
                            <select id="seleccion1"  onchange="obtenerDato1();">
                                    <option>Seleecione el conductor</option>
                                    <%     
                           Connection con1= null;
                           Statement st1 = null;
                           ResultSet rs1 = null;
                           try {

                                            String url1 = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                                            String username1 = "root";
                                            String password1 = "";
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con1= DriverManager.getConnection(url1, username1, password1);
                                            st1 = con.createStatement();
                                            rs1 = st.executeQuery("SELECT * FROM `conductor`");
                                            while (rs1.next()) {
                                    %>


                                    <option ><%= rs1.getInt(1)%></option>
                                    <option  class="form-control" disabled=" "><%= rs1.getString(2)%></option>


                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print("Error Mysql" + e);
                                        }
                                    %>

                                </select>
                                 <input type="text" class="form-control" id="id_conductor" name="id_conductor" placeholder="" required="required" readonly="readonly">

                                <script>
                                    function obtenerDato1() {

                                        var d1= document.getElementById("seleccion1").value;

                                        document.getElementById("id_conductor" ).value = d1;
                                    }
                                    
                             
                           
                                                           </script>
                        </div>
                        <div class="form-group">
                            <label for="placa">Seleccione la placa del vehiculo</label>
                            <!--input type="text" class="form-control" id="placa" name="placa1" placeholder="Placa" required="required"-->
                              <select id="seleccion3"  onchange="obtenerDato3();">
                                  <option>Seleccione la placa del vehiculo</option>
                                    <%
                          try {

                                            String url1 = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                                            String username1 = "root";
                                            String password1 = "";
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con1= DriverManager.getConnection(url1, username1, password1);
                                            st1 = con.createStatement();
                                            rs1 = st1.executeQuery("SELECT id_vehiculo, placa FROM `vehiculo`");
                                            while (rs1.next()) {
                                    %>


                                    <option ><%= rs1.getInt(1)%></option>
                                     <option  class="form-control" disabled=" "><%= rs1.getString(2)%></option>
                                     

                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print("Error Mysql" + " "+ e);
                                        }
                                    %>

                                </select>
                                 <input type="text" class="form-control"  id="id_vehiculo" name="id_vehiculo" placeholder="" required="required" readonly="readonly">

                                <script>
                                    function obtenerDato3() {

                                        var d3= document.getElementById("seleccion3").value;

                                        document.getElementById("id_vehiculo" ).value = d3;
                                    }
                                    
                             
                           
                                                           </script>
                        
                        </div>
                        
                        <div class="form-group">
                            <label for="infraccion">Seleccione código infracción</label>
                          <!--  <input type="number" class="form-control" id="infraccion" name="infraccion" placeholder="infraccion" required="required">-->
                              <select id="seleccion2"  onchange="obtenerDato2();">
                                    <option>Seleccione la infraccion</option>
                                    <%     
                    
                           try {

                                            String url1 = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                                            String username1 = "root";
                                            String password1 = "";
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con1= DriverManager.getConnection(url1, username1, password1);
                                            st1 = con.createStatement();
                                            rs1 = st1.executeQuery("SELECT * FROM `infraccion`");
                                            while (rs1.next()) {
                                    %>


                                    <option ><%= rs1.getInt(1)%></option>
                                    <option  class="form-control" disabled=" " ><%= rs1.getString(3)%></option>
                                    


                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print("Error Mysql" + e);
                                        }
                                    %>

                                </select>
                                 <input type="text" class="form-control"  id="infraccion" name="infraccion" placeholder="" required="required" readonly="readonly">

                                <script>
                                    function obtenerDato2() {

                                        var d2= document.getElementById("seleccion2").value;

                                        document.getElementById("infraccion" ).value = d2;
                                    }
                                    
                             
                           
                                                           </script>
                        </div>
                                    
                       
                        <div class="form-group">
                            <label for="lugar">lugar</label>
                            <input type="text" class="form-control" id="lugar" name="lugar" placeholder="lugar">
                        </div>
                       <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                                         <a href="index.jsp">Cancelar  <i class="fa fa-times" aria-hidden="true"></i></a>     
                       

                    </form>

                </div>
            </div>
        </div>
                                    
        <%
            String cedula2= request.getParameter("id_conductor");
            String id_infraccion= request.getParameter("infraccion");
            int puntos = 0;
            int puntos1 = 0;
            int gravedad = 0;
            try {
                   
                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password); 
                    
                    st = con.createStatement();
                    st1 = con.createStatement();
                    rs = st.executeQuery("SELECT `puntos` FROM `conductor` WHERE id_conductor="+ cedula2 + " ");
                    rs2 = st1.executeQuery("SELECT `id_gravedad` FROM `infraccion` WHERE id_infraccion="+ id_infraccion+ " ");
                    
                    while (rs2.next()){
                    
                        gravedad=rs2.getInt(1);
                    
                    }

                    while (rs.next()){

                    puntos = rs.getInt(1);
                    
                    }
                } catch (Exception e) {
                    out.print("se encontro un error2  : "+e);
                }

                if(gravedad == 1){
                    puntos = puntos-1;
                    puntos1 = 1;
                }
                if(gravedad == 2){
                    puntos = puntos-2;
                    puntos1 = 2;
                }
                if(gravedad == 3){
                    puntos = puntos-3;
                    puntos1 = 3;
                }
        %>
        
        <%
            if (request.getParameter("enviar") !=null) {
                //String multa= request.getParameter("id_multa");
                String cedula= request.getParameter("id_agente");
                //cedula2 = request.getParameter("id_conductor");                             
                String placaVehiculo = request.getParameter("id_vehiculo");     
                String fecha= request.getParameter("fecha");
                String ubicacion= request.getParameter("lugar");

                try {
                   
                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);           
                   
                    st=con.createStatement();
                    st1 = con.createStatement();
                    st3 = con.createStatement();
                    st.executeUpdate("insert into `multa` (id_agente,id_conductor,id_vehiculo,id_infraccion,fecha,lugar ) values("+cedula+","+cedula2+",'"+placaVehiculo+"',"+id_infraccion+",'"+b+"','"+ubicacion+"');");
                    st1.executeUpdate("UPDATE conductor SET puntos = "+puntos+" WHERE id_conductor="+cedula2+"");
                    st3.executeUpdate("INSERT INTO `puntos_eliminados` (`id_agente`, `puntos` , `fecha`) VALUES ("+cedula+","+puntos1+",'"+b+"')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error  : "+e);
                }

            }
        %>
    </body>
</html>
