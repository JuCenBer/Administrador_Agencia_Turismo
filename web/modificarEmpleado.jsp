<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Modificar Empleado</title>

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
		<header class="mb-4"><h2 class="tm-text-shadow">Modificar empleados</h2></header>
                    <div class="col-md-6 col-sm-12 tm-contact-col">
			<div class="contact_message" style="width: 40vw; margin-top: 50px">
                            <form action="SvModificarEmpleado" method="get" class="contact-form">
                                <%  
                                Empleado emple = (Empleado) misesion.getAttribute("emple");
                                {%>
                                
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required value="<%=emple.getNombre()%>">
				</div>
				<div class="form-group">
                                    <input type="text" name="apellido" class="form-control" placeholder="Apellido" required value="<%=emple.getApellido()%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="dni" class="form-control" placeholder="DNI" required value="<%=emple.getDni()%>">
				</div>
                                <div class="form-group">
                                        <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        String fecha_nac = sdf.format(emple.getFecha_nac());%>
					<input type="date" name="fecha_nac" class="form-control" placeholder="Fecha de nacimiento" required value="<%=fecha_nac%>">
				</div>
                                <div class="form-group">
                                    <input type="text" name="nacionalidad" class="form-control" placeholder="Nacionalidad" required value="<%=emple.getNacionalidad()%>">
				</div>
                                <div class="form-group">
					<input type="text" name="direccion" class="form-control" placeholder="Direccion" required value="<%=emple.getDireccion()%>">
				</div>
				<div class="form-group">
					<input type="text" name="cargo" class="form-control" placeholder="Cargo" required value="<%=emple.getCargo()%>">
				</div>
                                <div class="form-group">
					<input type="text" name="sueldo" class="form-control" placeholder="Sueldo" required value="<%=emple.getSueldo()%>">
				</div>
                                <div class="form-group">
					<input type="text" name="celular" class="form-control" placeholder="Celular" required value="<%=emple.getCelular()%>">
				</div>
                                <div class="form-group">
					<input type="email" name="email" class="form-control" placeholder="E-mail" required value="<%=emple.getEmail()%>"> 
				</div>
                                <div class="form-group">
					<input type="text" name="nombreUsu" class="form-control" placeholder="Nombre de Usuario" required value="<%=emple.getUsu().getNombreUsu()%>">
				</div>
                                <div class="form-group">
				<input type="text" name="contrasenia" class="form-control" placeholder="Contraseña" required value="<%=emple.getUsu().getContrasenia()%>">
				</div>
                                <input type="hidden" name="id" value="<%=emple.getId_empleado()%>">
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
