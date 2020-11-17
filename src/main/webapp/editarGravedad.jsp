<%-- 
    Document   : newjspmodificar
    Created on : 2 nov. 2020, 11:33:30
    Author     : jflin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Productos/estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>      

        <form action="ControladorGravedad?accion=actualizar" method="POST" autocomplete="off">
            <h1>Modificar registro</h1>
            <input id="id_gravedad"  name="id_gravedad" type="hidden" value="<%=request.getParameter("id_gravedad")%>"/>
            <div class="form-group">
                <label for="tipo_gravedad">Tipo de Gravedad</label>
                <input type="text" class="form-control" id="tipo_gravedad" name="tipo_gravedad" value="<%=request.getParameter("tipo_gravedad")%>">
            </div>
            <br>

            <button id="guardar" name="guardar" type="submit" >Guardar</button>

        </form>
    </body>
</html>
