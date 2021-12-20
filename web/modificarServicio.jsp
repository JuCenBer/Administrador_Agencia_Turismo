<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Modificar Servicio</title>

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
		<header class="mb-4"><h2 class="tm-text-shadow">Modificar Servicio</h2></header>
                    <div class="col-md-6 col-sm-12 tm-contact-col">
			<div class="contact_message" style="width: 40vw; margin-top: 50px">
                            <form action="SvModificarServicio" method="get" class="contact-form">
                                <%
                                Servicio ser = (Servicio) misesion.getAttribute("ser");
                                {%>
                                
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required value="<%=ser.getNombre()%>">
				</div>
				<div class="form-group">
                                    <input type="text" name="descripcion_breve" class="form-control" placeholder="Descripcion" required value="<%=ser.getDescripcion_breve()%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="destino_servicio" class="form-control" placeholder="Destino" required value="<%=ser.getDestino_servicio()%>">
				</div>
                                <div class="form-group">
                                        <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        String fecha = sdf.format(ser.getFecha_servicio());%>
					<input type="date" name="fecha_servicio" class="form-control" placeholder="Fecha" required value="<%=fecha%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="costo_servicio" class="form-control" placeholder="Costo" required value="<%=ser.getCosto_servicio()%>">
				</div>
                                <input type="hidden" name="id" value="<%=ser.getCodigo_servicio()%>">
                                <%}%>
				<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">Modificar</button>
                            </form>
			</div>
                    </div>
            </div>       		          	
        </section>
          <%}%>
    </body>
</html>
