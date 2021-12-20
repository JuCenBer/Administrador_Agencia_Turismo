<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Venta"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
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
                            <th scope="col">Mes</th>
                            <th scope="col">Recaudacion total</th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        List <Venta> listaVentas = (List) request.getSession().getAttribute("listaVentas");
                        int mesAct=0;
                        int anioAct=0;
                        Venta ven1 = listaVentas.get(0);
                        Date fecha = ven1.getFecha_venta();
                        LocalDate fechaLocal = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                        double sum = 0;
                        mesAct = fechaLocal.getMonthValue();
                        anioAct = fechaLocal.getYear();
                        LocalDateTime now = LocalDateTime.now(); 
                        for(Venta ven: listaVentas){
                           fecha = ven.getFecha_venta();
                            fechaLocal = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                           
                            if ((fechaLocal.getMonthValue() == mesAct) && (fechaLocal.getYear() == anioAct)) {
                                sum += ven.getCosto();
                            }
                            else{
                        %>
                        <tr>
                            <%String aux = (String.valueOf(mesAct)+"-"+String.valueOf(anioAct));%>
                            <td> <%=aux%> </td>
                            <td> $ <%=sum%></td>
                        </tr>
                        <% mesAct = fechaLocal.getMonthValue();
                        anioAct = fechaLocal.getYear();
                        sum = ven.getCosto();}
                        
                        }%>
                        <tr>
                            <%String aux = (String.valueOf(mesAct)+"-"+String.valueOf(anioAct));%>
                            <td> <%=aux%> </td>
                            <td> $ <%=sum%></td>
                        </tr>
                  </tbody>
                        
                </table>
            </div>
            </div>
            <%}%>
    </body>
</html>
