<%-- 
    Document   : index2
    Created on : 10-nov-2020, 23:20:34
    Author     :leonardo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        
        
        /* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */

body {
  padding-top: 3rem;
  padding-bottom: 3rem;
  color: #5a5a5a;
    text-align: center;
}


/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
  margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  bottom: 3rem;
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
  height: 32rem;
}
.carousel-item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 32rem;
}


/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 1.5rem;
  text-align: center;
}
.marketing h2 {
  font-weight: 400;
}
.marketing .col-lg-4 p {
  margin-right: .75rem;
  margin-left: .75rem;
}


/* Featurettes
------------------------- */

.featurette-divider {
  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  letter-spacing: -.05rem;
}


/* RESPONSIVE CSS
-------------------------------------------------- */

@media (min-width: 40em) {
  /* Bump up size of carousel content */
  .carousel-caption p {
    margin-bottom: 1.25rem;
    font-size: 1.25rem;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}

h1{

	
	font-size: 500px;
	color: black;
        text-align: center;

}
h2{

	
	font-size: 100px;
	color: black;
        text-align: center;

}footer{
    

	font-size: 17px;
	color: black;
        text-align: center;
}

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
         <title>Principal</title>
    </head>

    <body >
 <header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Inicio</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        
      </ul>
    
    </div>
  </nav>
</header>
        
        <div>
            
        </div>
        <div>
            
            <h1>Bienvenido al Sistema de informacion de transito Puntomatik</h1>
             <h2 >seleccione el rol con el que desea ingresar a la plataforma</h2>
        </div>


   <hr></hr>

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
         <img src="iconos/agente.jpg" width="300" height="150">
        <h2>Agente</h2>
        <p>Portal autorizado solo para un agente de transito.</p>
        <p><a class="btn btn-secondary" href="loginAgente.jsp" role="button">Ingresar &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="iconos/conductor.jpg" width="100" height="125">
          <h2>Conductor</h2>
        <p>si es un conductor registrado, ingrese con su cedula, de lo contrario comuniquese con el DIT.</p>
        <p><a class="btn btn-secondary" href="historialConductor.jsp" role="button">ver historial &raquo;</a></p>
        <p><a class="btn btn-secondary" href="consultarPuntos.jsp" role="button">consultar puntos &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="iconos/DTI.jpg" width="100" height="100">
          <h2>DTI</h2>
        <p>INGRESO DE ADMINISTRADOR DE LA PLATAFORMA.</p>
        <p><a class="btn btn-secondary" href="login.jsp" role="button">Ingresar &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

        <footer class="container" >
    
    <p>Copyright &copy; 2020  PuntoMatik  -  Todos los derechos reservados</p>
  </footer>
    </body>

</html>
