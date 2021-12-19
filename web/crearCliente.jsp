<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "es">
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Alta Cliente</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <body>
        <%
        HttpSession misesion = request.getSession();
        String usuario = (String) misesion.getAttribute("usuario");
        String contrasenia = (String) misesion.getAttribute("contrasenia");
        int idEmpleado = (Integer) misesion.getAttribute("idEmpleado");
            if(usuario == null){
                response.sendRedirect("login.jsp");
            }
            else{
        %>
        <section id="tm-section-2" class="tm-section">
            <div class="tm-bg-transparent-black tm-contact-box-pad" style="width: 50vw;">
		<header class="mb-4"><h2 class="tm-text-shadow">Alta Clientes</h2></header>
                    <div class="col-md-6 col-sm-12 tm-contact-col">
			<div class="contact_message" style="width: 40vw; margin-top: 50px">
                            <form action="SvAltaCliente" method="POST" class="contact-form">
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required>
				</div>
				<div class="form-group">
                                    <input type="text" name="apellido" class="form-control" placeholder="Apellido" required>
				</div>
                                <div class="form-group">
                                    <input type="text" name="dni" class="form-control" placeholder="DNI" required>
				</div>
                                <div class="form-group">
					<input type="date" name="fecha_nac" class="form-control" placeholder="Fecha de nacimiento" required>
				</div>
                                <div class="form-group">
                                    <input type="text" name="nacionalidad" class="form-control" placeholder="Nacionalidad" required>
				</div>
                                <div class="form-group">
					<input type="text" name="direccion" class="form-control" placeholder="Direccion" required>
				</div>
                                <div class="form-group">
					<input type="text" name="celular" class="form-control" placeholder="Celular" required>
				</div>
                                <div class="form-group">
					<input type="email" name="email" class="form-control" placeholder="E-mail" required>
				</div>
				<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">Submit</button>
                            </form>
			</div>
                    </div>
            </div>       		          	
        </section>
        <%}%>
    </body>
</html>
