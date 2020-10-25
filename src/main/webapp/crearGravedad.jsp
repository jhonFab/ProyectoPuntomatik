<%-- 
    Document   : crearGravedad
    Created on : 23 oct. 2020, 23:45:22
    Author     : jflin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>
        body{
            background: #66ffcc; 
            margin: auto;
            border: blue;
        }
        .formulario_1{
            width: 400px;
            height: 400px;
            text-align: center;
            border: 5px solid grey;
            margin: auto;
            position: static; 
            border-radius: 5px;
            background: white;
        }
        .titulo{
            
            margin: auto;
            text-align: center; 
            border: 3px slateblue;
        }
        
    </style>
        
    <body>
        
        <form  class="formulario_1" action="index.jsp" method="post">
            <h2 class="titulo"> Registro de Gravedad de multas </h2>
            <br>
            <label for="nombre">Nombre</label>
             <input type="text" class="form-control" id="nombre"  name="nombre" placeholder="Nombre" required="required">     
            
           
           
        </form>
    </body>
</html>
