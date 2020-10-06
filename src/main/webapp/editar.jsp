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
                String nombre= request.getParameter("nombre");
                String cedula= request.getParameter("cedula");
                String email= request.getParameter("email");                
                String telefono = request.getParameter("telefono");
                String usuario= request.getParameter("usuario");
                String contraseña= request.getParameter("contrasena");
                
        %>
        <h1 class="text-center mt-5">Modificar conductores</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                         <div class="form-group">
                            <label for="cedula">Cedula</label>
                            <input type="number" class="form-control" id="cedula" value="<%= cedula %>" name="cedula" placeholder="Cedula" required="required">
                        </div>
                         <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" value="<%= email %>" name="email" placeholder="Ejemplo@dominio.com" required="required">
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
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                   
                            <a href="consultar.jsp" class="btn-light"> Cancelar<i class="fa fa-arrow-circle-left" aria-hidden="true"></i></a>
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
                    String url = "jdbc:mysql://localhost:3306/prueba";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);           
                   
                    st=con.createStatement();
                    st.executeUpdate("update `agente`  set nombre='"+nombre+"',cedula="+cedula+",email='"+email+"',telefono='"+telefono+"',usuario='"+usuario+"' where contrasena= '"+contraseña+"' ");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("se encontro un error  :  "+e);
                }

            }
        %>
    </body>
</html>