<%-- 
    Document   : app
    Created on : 25 sep. 2020, 21:58:36
    Author     : jflin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
         
        <title>Principal</title>
        
    </head>
  
    
    <body   >
          
        
        <h1 style="text-align: center" class="mt-5"> PuntoMatik </h1>
        <h1 style="text-align: center"> Sistema unificado para las infracciones de conductores</h1>
        <hr style="width:100%; border-color: blue" >
        
        
        
	<head>
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
			
			ul, ol {
				list-style:none;
			}
			
			.nav > li {
				float:left;
			}
			
			.nav li a {
				background-color:#225    ;
				color:#fff;
				text-decoration:none;
				padding:10px 12px;
				display:block;
			}
			
			.nav li a:hover {
				background-color:#434343;
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
                        
			
		</style>
	</head>
	<body>
		<div id="header">
			<ul class="nav">
				<li><a href="app.jsp">Inicio</a></li>
				<li><a href="">Servicios</a>
					<ul>
                                                <li><a href="consultapuntos.jsp">Consultas Puntos</a></li>
						<li><a href="">Consultas infracciones</a></li>
						<li><a href="index.jsp">Consultas Conductores</a></li>
						<li><a href="">Historial</a>
							<ul>
								<li><a href="">Submenu1</a></li>
								<li><a href="">Submenu2</a></li>
								<li><a href="">Submenu3</a></li>
								<li><a href="">Submenu4</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="">Acerca de</a>
					<ul>
						<li><a href="">Submenu1</a></li>
						<li><a href="">Submenu2</a></li>
						<li><a href="">Submenu3</a></li>
						<li><a href="">Submenu4</a></li>
					</ul>
				</li>
				<li><a href="">Contacto</a></li>
			</ul>
		</div>
            
	</body>

        
       

        <form action="index.jsp" method="post">
            
            
            <input type="submit" value="ir" style="animation: linear">
        </form>
        
        <h1 style="text-decoration: blue; text-align: center">Bienvenidos a Puntomatik</h1>
        
         <form action="index.jsp" method="post">
                <input type="submit" value="Consultar">
                
            </form>
        
    </body>
</html>