<%@page import="logica.Servicio"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Paquetes</title>
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

                <table class="table custom-table">
                  <thead>
                        <tr>  
                            <th scope="col">ID</th>
                            <th scope="col">Servicios Incluidos</th>
                            <th scope="col">Costo</th>
                            <th scope="col"></th>
                            <th scopte="col"></th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        List <Paquete> listaPaquetes = (List) request.getSession().getAttribute("listaPaquetes");
                        for (Paquete paq: listaPaquetes){
                            if (paq.isHabilitado()) {
                        %>
                        <tr>
                            <%int ID= paq.getIdPaquete();%>
                            <td> <%=ID%> </td>
                            <%  List <Servicio> listaServicios = paq.getLista_servicios_incluidos();
                                String nombre = " ";
                                for (Servicio ser: listaServicios) {
                                 nombre = nombre + " - " + ser.getNombre();
                                }%>
                            <td><%=nombre%></td>
                            <% double costo_paquete =paq.getCosto_paquete();%>
                            <td><%=costo_paquete%></td>
                            <td>
                                <form name="formBorrarPaquete" action="SvEliminarPaquete" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-danger">Eliminar</button>
                                </form>
                                <form name="formModificarPaquete" action="SvModificarPaquete" method="post">
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
