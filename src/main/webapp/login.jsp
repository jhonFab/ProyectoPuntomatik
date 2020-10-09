<%-- 
    Document   : login
    Created on : 4 oct. 2020, 21:03:41
    Author     : jflin
--%>

<%@page import="javax.accessibility.AccessibleRole"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Login</title>
    </head>
    
  <h1 style="text-align: center" class="mt-5"> PuntoMatik </h1>
        <h1 style="text-align: center"> Inicio de sesión</h1>
        <hr style="width:75%; border-color: blue" >
    <body>
        <div class="container mt-5 ">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="form-group">
                            <label >Usuario</label>
                            <input type="text" class="form-control" name="usuario"placeholder="Ingrese usuario">
                            
                            </div>
                        <div class="form-group">
                            <label >Password</label>
                            <input type="password" class="form-control" name="contrasena" placeholder="Ingrese password">
                            
                            </div>
                        
                        <button type="submit" class="btn btn-primary"name="login"><i class="fa fa-sign-in" aria-hidden="true"></i> Login </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    
    <%
     if (request.getParameter("login")!=null){
            String usuario= request.getParameter("usuario");
            String contrasena= request.getParameter("contrasena");
            HttpSession sesion=request.getSession();
            if(usuario.equals("1234")&&contrasena.equals("1234")){
                sesion.setAttribute("logueo", "1");
                sesion.setAttribute("usuario", usuario);
                response.sendRedirect("index.jsp");
        }
        else{
                out.print("usario o contraseña invalido");
                
        }
        }
    %>
</html>
