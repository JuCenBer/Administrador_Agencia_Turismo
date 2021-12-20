<%@page import="java.util.ArrayList"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Venta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Ventas</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <body style="background-color:grey;">
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
        <div class="container">
            	
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
                            <div class="media tm-bg-transparent-black tm-border-white">
                                <i class="fas fa-list mr-4 tm-icon-circled tm-icon-media"></i>
                                <div class="media-body">
                                    <form action="SvConsultarRecaudaciones" method="GET">
                                        <button type="submit" class="btn tm-btn-submit tm-btn ml-auto" href="SvConsultarRecaudaciones">Recaudacion mensual</button>
                                    </form>
                                </div>
                            </div>
                    </div>	
                    <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
                            <div class="media tm-bg-transparent-black tm-border-white">	
                                <i class="fas fa-list mr-4 tm-icon-circled tm-icon-media"></i>
                                <div class="media-body">
                                    <form action="SvConsultarRecaudaciones" method="POST">
                                        <button type="submit" class="btn tm-btn-submit tm-btn ml-auto" href="SvConsultarRecaudaciones">Recaudacion diaria</button>
                                    </form>										
                                </div>
                            </div>
                    </div>    
                </div>
                <table class="table custom-table">
                  <thead>
                        <tr>  
                            <th scope="col">ID</th>
                            <th scope="col">Fecha de Venta</th>
                            <th scope="col">ID Empleado</th>
                            <th scope="col">ID Cliente</th>
                            <th scope="col">Servicios Incluidos</th>
                            <th scope="col">Metodo de pago</th>
                            <th scope="col">Costo</th>
                            <th scope="col"></th>
                            <th scopte="col"></th>
                        </tr>
                  </thead>
                  <tbody>
                        <% 
                        List <Venta> listaVentas = (List) request.getSession().getAttribute("listaVentas");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        for (Venta ven: listaVentas){
                        %>
                        <tr>
                            <%int ID= ven.getNum_venta();%>
                            <td> <%=ID%> </td>
                            <%String fecha_venta = sdf.format(ven.getFecha_venta());%>
                            <td><%=fecha_venta%></td>
                            <% double costo = 0;
                               Servicio ser = ven.getServi();
                               Paquete paq = ven.getPaque();
                               String serviciosVendidos=" ";
                               List<Servicio>listadoServiciosPaquete = null;
                               if(ser != null){
                                   serviciosVendidos = ser.getNombre() + "-";
                               }
                               
                               try{
                                listadoServiciosPaquete = paq.getLista_servicios_incluidos();
                               }
                               catch(Exception e){
                                   
                               }
                               
                               if(listadoServiciosPaquete != null){
                               for(Servicio ser1: listadoServiciosPaquete){
                                   costo += ser1.getCosto_servicio();
                                   serviciosVendidos += ser1.getNombre()+ " - ";
                               }}
  
                               
                                  
                                %>
                            <td><%=ven.getEmple().getId_empleado()%></td>
                            <td><%=ven.getCli().getId_cliente()%></td>
                            <td><%=serviciosVendidos%></td>
                            
                            <td><%=ven.getMedio_pago()%></td>
                            <td><%=ven.getCosto()%></td>
                            <td>
                                <form name="formBorrarPaquete" action="SvEliminarVenta" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-danger">Eliminar</button>
                                </form>
                                <form name="formModificarPaquete" action="SvModificarVenta" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-light">Modificar</button> 
                                </form>
                            </td>
                        </tr>
                  </tbody>
                        <%}%>
                </table>
            </div>
            </div>
            <%}%>
    </body>
</html>
