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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificar registro</h1>
            <form action="ControladorGravedad?accion=actualizar" method="POST" autocomplete="off">
                <input id="id_gravedad"  name="id_gravedad" type="hidden" value="<%=request.getParameter("id_gravedad")%>"/>
            
            <p>
                Tipo Gravedad:
                <input id="tipo_gravedad"  name="tipo_gravedad" type="text"value="<%=request.getParameter("tipo_gravedad")%>"/>
            </p>
                       
            <button id="guardar" name="guardar" type="submit" >Guardar</button>
            
        </form>
    </body>
</html>
