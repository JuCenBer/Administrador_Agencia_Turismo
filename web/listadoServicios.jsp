<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Servicios</title>
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
                <h2 class="col-xl-12"><h2 class="tm-text-shadow">Servicios</h2>
                <table class="table custom-table">
                  <thead>
                        <tr>  
                            <th scope="col">Nombre</th>
                            <th scope="col">ID</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Destino</th>
                            <th scope="col">Fecha del servicio</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Paquetes asociados</th>
                            <th scope="col"></th>
                            <th scopte="col"></th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        List<Servicio> listaServicios =(List) request.getSession().getAttribute("listaServicios");
                        for (Servicio ser: listaServicios){
                            if(ser.isHabilitado()){
                        %>
                        <tr>
                            <%String nombre = ser.getNombre();%>
                            <td> <%=nombre%> </td>
                            <% int ID = ser.getCodigo_servicio();%>
                            <td> <%=ID%></td>
                            <% String descripcion_breve = ser.getDescripcion_breve();%>
                            <td> <%=descripcion_breve%></td>
                            <% String destino_servicio = ser.getDestino_servicio();%>
                            <td> <%=destino_servicio%></td>
                            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String fecha = sdf.format(ser.getFecha_servicio());%>
                            <td> <%=fecha%></td>
                            <% double costo_servicio = ser.getCosto_servicio();%>
                            <td> <%=costo_servicio%></td>
                            <%  List <Paquete> listaPaquetes = ser.getLista_paquetes();
                                String idPaq = " ";
                                for (Paquete paq: listaPaquetes) {
                                 idPaq = idPaq + " - " + String.valueOf(paq.getIdPaquete());
                                }%>
                            <td>
                                <%=idPaq%>
                            </td>
                            <td>
                                <form name="formBorrarServicio" action="SvEliminarServicio" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-danger">Eliminar</button>
                                </form>
                                
                            </td>
                            <td>
                                <form name="formModificarServicio" action="SvModificarServicio" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-light">Modificar</button> 
                                </form>
                            </td>
                        </tr>
                  </tbody>
                        <%}}%>
                </table>
            </div>
            </div>
            <%}%>
    </body>
</html>
