<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Alta Servicio</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <body>
        <section id="tm-section-2" class="tm-section">
            <div class="tm-bg-transparent-black tm-contact-box-pad" style="width: 50vw;">
		<header class="mb-4"><h2 class="tm-text-shadow">Alta Servicios</h2></header>
                    <div class="col-md-6 col-sm-12 tm-contact-col">
			<div class="contact_message" style="width: 40vw; margin-top: 50px">
                            <form action="SvAltaServicio" method="POST" class="contact-form">
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required>
				</div>
				<div class="form-group">
                                    <input type="text" name="descripcion" class="form-control" placeholder="Descripcion" required>
				</div>
                                <div class="form-group">
                                    <input type="text" name="destino_servicio" class="form-control" placeholder="Destino de servicio" required>
				</div>
                                <div class="form-group">
					<input type="date" name="fecha_servicio" class="form-control" placeholder="Fecha de servicio" required>
				</div>
                                <div class="form-group">
                                    <input type="text" name="costo_servicio" class="form-control" placeholder="Costo" required>
				</div>
				<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">Submit</button>
                            </form>
			</div>
                    </div>
            </div>       		          	
        </section>
    </body>
</html>
