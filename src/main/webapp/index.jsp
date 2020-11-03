<%-- 
    Document   : app
    Created on : 25 sep. 2020, 21:58:36
    Author     : jflin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Principal</title>
    </head>

    <body  style="background-image: url('https://besthqwallpapers.com/img/original/99458/blue-creative-texture-dark-blue-abstract-background-creative-blue-backgrounds-background-with-lines-stylish-blue-texture.jpg');">
        <% java.text.DateFormat fecha = new SimpleDateFormat("EEE, d MMM yyyy ");%>
 
        <h2 style="color: white;text-align: left;font-size: 25px"; >Fecha : <%= fecha.format(new java.util.Date())%></h2>
       

     
        <h1 style="color: white;text-align: center;font-size: 56px"; >Bienvenidos</h1>
        <h1 style="color: white;text-align: center;font-size: 48px" class="mt-5"> PuntoMatik </h1>
        <h1 style="color: white;text-align: center;font-size: 48px"> Sistema unificado para las infracciones de conductores</h1>
        <hr style="width:95%; border-color: white; text-align: center" >

        <title>Menu Desplegable</title>
        <style type="text/css">

            * {
                margin:0px;
                padding:0px;
            }

            #header {
                margin:auto;
                width:500px;
                font-family:Arial, Helvetica, sans-serif;
            }
            
            #video, #texto{
                float: left;
                width: 50%;
            }
            #video iframe{
                text-align: left;
            }
            #texto {
                border: 0;
                height: 480px;
                width: 50%;
                font-family:Arial, Helvetica, sans-serif;
            }

            ul, ol {
                list-style:none;
            }

            .nav > li {
                float:left;
            }

            .nav li a {
                background-color:#90    ;
                color:#fff;
                text-decoration:none;
                padding:10px 12px;
                transition: all 1s;
                display:block;
            }

            .nav li a:hover {
                background-color:#434393;
            }

            .nav li ul {
                display:none;
                position:absolute;
                min-width:140px;
            }

            .nav li:hover > ul {
                display:block;
            }

            .nav li ul li {
                position:relative;
            }

            .nav li ul li ul {
                right:-140px;
                top:0px;
            }
            
            footer{
                font-family:Arial, Helvetica, sans-serif;
            }

        </style>
    </head>
<body>
    <div id="header">
        <ul class="nav">
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="">Consultas</a>
                <ul>  
                    <li><a href="consultarAgente.jsp">Consultas lista Conductores</a></li>
                    <li><a href="">Conductor</a>
                        <ul>
                            <li><a href="historialConductor.jsp">Historial</a></li>
                            <li><a href="consultarPuntos.jsp">consultas puntos</a></li>
                        </ul>
                    </li>
                    <li><a href="">Agente</a>
                        <ul>
                            <li><a href="consultaProductividadAgente.jsp">Productividad</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href="">Registrar</a>
                <ul>
                    
                    <li><a href="">Agentes</a>
                        <ul>
                            <li><a href="crearAgente.jsp">Crear Agentes</a></li>
                            <li><a href="consultarAgente.jsp">Consultar Agentes</a></li>
                            <li><a href="">Submenu2</a></li>
                            
                        </ul>
                    </li> 


                    <li><a href="crearConductor.jsp">Conductores</a></li>
                    <li><a href="crearVehiculo.jsp">Vehiculos</a></li>
                    <li><a href="crear_multa.jsp">multas</a></li>
                </ul>
            </li>
            <li><a href="">Otros</a>
                <ul>
                    <li><a href=".jsp">Eliminar</a></li>
                    <li><a href="crearGravedad.jsp">Registar Grvedad</a></li>
                    <li><a href="">pendiente</a></li>
                    <li><a href="">pendeinte</a></li>
                </ul>


            </li>
        </ul>
    </div>
    <div id="video" style="color: white;text-align: left;font-size: 56px" class="mt-5 p-3 p-6";>
      
     <iframe class="text-center" width="400" height="300" src="https://www.youtube.com/embed/uosPs8z-alI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    
    <div id="texto" style="color: white;text-align: left;font-size: 18px" class="mt-5 p-3 p-6">
        <h4>PuntoMatik</h4><br>
        <p>Plataforma central de PuntoMatik. Consultas, registros, actualizaciones de informacion
            todo un servicio a tu alcanze, para lo conductores y para los agentes de transito.
            Comprometidos a tu servicio.</p><br>
        <p>"Si uno avanza confiadamente en la dirección de sus sueños y deseos, se encontrará con el éxito". 
            Henry David</p>
    </div>



<footer style="color: white;text-align: center;font-size: 17px">
        <p>Copyright &copy; 2020  PuntoMatik  -  Todos los derechos reservados</p>
    </footer>
</body>

</body>
</html>