<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>editar empleado</title>
    </head>
    <body>
        <% 
                String cedula= request.getParameter("id_agente");  
                String nombre= request.getParameter("nombre");         
                String telefono = request.getParameter("telefono");
                String usuario= request.getParameter("usuario");
                String contraseña= request.getParameter("contrasena");
                String seccional= request.getParameter("seccional"); 
                
        %>
        <h1 class="text-center mt-5">Modificar agente</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="editarAgente.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                         <div class="form-group">
                            <label for="id_agente">Cedula</label>
                            <input type="number" class="form-control" id="id_agente" value="<%= cedula %>" name="id_agente" placeholder="Cedula" required="required">
                        </div>
                        
                         <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="number" class="form-control" id="telefono" value="<%= telefono %>" name="telefono" placeholder="Telefono" required="required">
                        </div>
                        
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" id="usuario" value="<%=usuario %>" name="usuario" placeholder="Usuario" required="required">
                        </div>
                        <div class="form-group">
                            <label for="contrasena">Contraseña</label>
                            <input type="password" class="form-control" id="contrasena"value="<%= contraseña %>" name="contrasena" placeholder="Contraseña" required="required">
                        </div>
                         <div class="form-group">
                            <label for="seccional">seccional</label>
                            <input type="number" class="form-control" id="seccional" value="<%= seccional%>" name="seccional" placeholder="seccional" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                   
                            <a href="consultarAgente.jsp" class="btn-light"> Cancelar<i class="fa fa-arrow-circle-left" aria-hidden="true"></i></a>
</button>
                       

                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") !=null) {
                

                try {
                    Connection con=null;
                    Statement st=null;
                    String url = "jdbc:mysql://localhost:3306/software?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);           
                   
                    st=con.createStatement();
                    st.executeUpdate("update `agente`  set id_agente="+cedula+",nombre='"+nombre+"',telefono='"+telefono+"',usuario="+usuario+" where contrasena= '"+contraseña+"',seccional="+seccional+" ");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error  :  "+e);
                }

            }
        %>
    </body>
</html>