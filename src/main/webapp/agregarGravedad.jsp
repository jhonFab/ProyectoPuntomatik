<%-- 
    Document   : nuevo
    Created on : 2 nov. 2020, 11:34:11
    Author     : jflin
--%>

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
        <h1 class="text-center mt-5">Registrar  Gravedad</h1>
        <hr style="width:75%; border-color: blue" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="ControladorGravedad?accion=insertar" method="POST" autocomplete="off">

                        <div class="form-group">
                        <label for="id_gravedad">ID Gravedad</label>
                        <input type="text" class="form-control" id="id_gravedad"  name="id_gravedad" placeholder="tipo de garvedad" required="required">
                        </div>
                         <div class="form-group">
                            <label for="tipo_gravedad">Tipo de Gravedad</label>
                            <input type="text" class="form-control" id="tipo_gravedad" name="tipo_gravedad" placeholder="tipo de garvedad" required="required">
                        </div>
                     
                         <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                                         <a href="index.jsp">Cancelar  <i class="fa fa-times" aria-hidden="true"></i></a>  
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
