<%@page import="java.util.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Alta Paquete</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <body><div class="container">
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione los servicios</h2></header>	
                <form name="formCrearPaquete" method="post" action="SvAltaPaquete">
                <table class="table custom-table">
                  <thead>
                        <tr> 
                            <th scope="col"></th>
                            <th scope="col">Nombre</th>
                            <th scope="col">ID</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Destino</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Costo</th>
                        </tr>
                  </thead>
                  <tbody>
                      
                        <% HttpSession misesion = request.getSession() ;
                        int i = 0;
                        List <Servicio> listaServicios = (List) request.getSession().getAttribute("listaServicios");
                        for (Servicio ser: listaServicios){
                            if(ser.isHabilitado()){
                        %>
                        <tr>
                            <% int ID = ser.getCodigo_servicio();%>
                            <td><input name="checkbox<%=i%>" class="check" type="checkbox" value="<%=ID%>"></td>
                            <%String nombre = ser.getNombre();%>
                            <td> <%=nombre%> </td>
                            
                            <td> <%=ID%></td>
                            <% String descripcion_breve = ser.getDescripcion_breve();%>
                            <td> <%=descripcion_breve%></td>
                            <% String destino_servicio = ser.getDestino_servicio();%>
                            <td> <%=destino_servicio%></td>
                            <% Date fecha_servicio= ser.getFecha_servicio();%>
                            <td> <%=fecha_servicio%></td>
                            <% double costo_servicio = ser.getCosto_servicio();%>
                            <td> <%=costo_servicio%></td>
                        </tr>
                        
                        <%i++; }}%>
                  </tbody> 
                </table>
                  <button class="btn tm-btn-submit tm-btn ml-auto" type="submit">Crear Paquete</button> 
                </form>
            </div>  
            </div>
        </section>
        <script> //js para limite de checkbox marcados
            var checks = document.querySelectorAll(".check");
            var max = 10;
            for (var i = 0; i < checks.length; i++)
              checks[i].onclick = selectiveCheck;
            function selectiveCheck (event) {
              var checkedChecks = document.querySelectorAll(".check:checked");
              if (checkedChecks.length >= max + 1)
                return false;
            }
        </script>
        
    </body>

</html>
