<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Modificar Cliente</title>

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
		<header class="mb-4"><h2 class="tm-text-shadow">Modificar Cliente</h2></header>
                    <div class="col-md-6 col-sm-12 tm-contact-col">
			<div class="contact_message" style="width: 40vw; margin-top: 50px">
                            <form action="SvModificarCliente" method="get" class="contact-form">
                                <% HttpSession misesion = request.getSession(); 
                                Cliente cli = (Cliente) misesion.getAttribute("cli");
                                {%>
                                
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required value="<%=cli.getNombre()%>">
				</div>
				<div class="form-group">
                                    <input type="text" name="apellido" class="form-control" placeholder="Apellido" required value="<%=cli.getApellido()%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="dni" class="form-control" placeholder="DNI" required value="<%=cli.getDni()%>">
				</div>
                                <div class="form-group">
					<input type="date" name="fecha_nac" class="form-control" placeholder="Fecha de nacimiento" required value="<%=cli.getFecha_nac()%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="nacionalidad" class="form-control" placeholder="Nacionalidad" required value="<%=cli.getNacionalidad()%>">
				</div>
                                <div class="form-group">
					<input type="text" name="direccion" class="form-control" placeholder="Direccion" required value="<%=cli.getDireccion()%>">
				</div>
                                <div class="form-group">
					<input type="text" name="celular" class="form-control" placeholder="Celular" required value="<%=cli.getCelular()%>">
				</div>
                                <div class="form-group">
					<input type="email" name="email" class="form-control" placeholder="E-mail" required value="<%=cli.getEmail()%>"> 
				</div>
                                <input type="hidden" name="id" value="<%=cli.getId_cliente()%>">
                                <%}%>
				<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">Modificar</button>
                            </form>
			</div>
                    </div>
            </div>       		          	
        </section>
    </body>
</html>
