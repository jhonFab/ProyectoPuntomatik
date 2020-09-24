<%-- 
    Document   : index
    Created on : 19 sep. 2020, 20:14:21
    Author     : jflin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Saluda HUmano</title>
    </head>
    <body class="p-3 mb-2 bg-success text-white">
        <h1>Registro Conductor leo</h1>
       
        
        <div class="p-3 mb-2 bg-secondary text-white container mt-5 ">
        <form>
            
            <div class="form-group">
                <label for="Conductor escribe tu nombre">Nombre</label >
                <input type="text" class="form-control" name="nombreConductor" placeholder="Nombre">
               </div>
            <div class="form-group">
                <label for="cedula">Cedula</label>
                <input type="text" class="form-control" name="cedulaConductor" placeholder="Cedula">
               </div>
             <div class="form-group">
                <label for="Conductor escribe tu email">E_mail</label>
                <input type="email" class="form-control" name="emailConductor" placeholder="ejemplo@hotmail.com">
               </div>
             <div class="form-group">
                <label for="Conductor escribe tu  celular">No. Celular</label>
                <input type="number" class="form-control" name="celularConductor" placeholder="numero de celular">
               </div>
            <div class="form-group">
                <label for="Conductor escribe tu  celular">No. Celular</label>
                <input type="number" class="form-control" name="celularConductor" placeholder="numero de celular">
               </div>
            <div class="form-group">
                <label for="Conductor escribe tu  celular"> Usuario</label>
                <input type="text" class="form-control" name="ussuarioConductor" placeholder="Usuario">
               </div>
            <div class="form-group">
                <label for="Conductor escribe tu  celular">Contraseña</label>
                <input type="password" class="form-control" name="contraseñaConductor" placeholder="Contraseña">
               </div>
           <div class="form-group">
                <label for="Conductor escribe tu  celular">Confirmar contraseña</label>
                <input type="password" class="form-control" name="contraseñaConductor" placeholder="confirmar contraseña">
               </div>
            <button type="submit" class="btn btn-light">Registrar</button>
        </form>
        </div>
    </body>
</html>
