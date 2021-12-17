<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Inicio de sesion</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">

	<script>
		var renderPage = true;

	if(navigator.userAgent.indexOf('MSIE')!==-1
		|| navigator.appVersion.indexOf('Trident/') > 0){
   		/* Microsoft Internet Explorer detected in. */
   		alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
   		renderPage = false;
	}
        </script>
    </head>
    <body>
        
        
        <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4" style=" position: relative; left:15vw; top:25vh; width: 50vw; height: 40vh;">
                <div class="media tm-bg-transparent-black tm-border-white" style="display: flex; flex-direction: row; justify-content: space-between; width: 70vw; height: 40vh">
                        <div class="row mb-4" style="align-self: center; width: 20vw;">
                            <header class="mb-4"><h1 class="tm-text-shadow">Inicio de sesión</h1></header>
                         </div>
                        <div class="media-body" style="max-width: 35vw;">
                            <form name="formSvIniciarSesion" action="SvIniciarSesion" method="post">
                                <input type="text" class="form-control" placeholder="Nombre de usuario"></input>
                                <input type="text" class="form-control" placeholder="Contraseña" style="margin-top:3vh;"></input>
                                <button type="submit" class="btn tm-btn-submit tm-btn ml-auto" href="SvIniciarSesion" style="margin-top:3vh;">Login</button>
                            </form>
                        </div>
                </div>
        </div>
    </body>
</html>
