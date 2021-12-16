<%@page import="java.util.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
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
        <div class="container">
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">
                <header class="col-xl-12"><h2 class="tm-text-shadow">Informacion de la Compra</h2></header>
                <form name="formConfirmarVentaServicio" action="SvConfirmarVentaServicio" method="post">
                <table class="table custom-table">
                  <thead>
                        <tr>  
                            <th scope="col">Clientes</th>
                            <th scope="col">ID</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Celular</th>
                            <th scope="col">E-mail</th>
                            <th scope="col">Nacionalidad</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Fecha de Nacimiento</th>
                        </tr>
                  </thead>
                  <tbody>
                        <% HttpSession misesion = request.getSession() ;
                        
                        Double costo = (Double) misesion.getAttribute("costo");
                        String medioPago = (String) misesion.getAttribute("medioPago");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Cliente cli = (Cliente) misesion.getAttribute("cli");
                        %>
                        <tr>
                            <%String nombreCli = cli.getNombre() + " " + cli.getApellido();%>
                            <td> <%=nombreCli%> </td>
                            <% int ID = cli.getId_cliente();%>
                            <td> <%=ID%></td>
                            <% String DNI = cli.getDni();%>
                            <td> <%=DNI%></td>
                            <% int celular = cli.getCelular();%>
                            <td> <%=celular%></td>
                            <% String Email = cli.getEmail();%>
                            <td> <%=Email%></td>
                            <% String nacionalidad = cli.getNacionalidad();%>
                            <td> <%=nacionalidad%></td>
                            <% String direccion = cli.getDireccion();%>
                            <td> <%=direccion%></td>
                            <% String fecha_nac = sdf.format(cli.getFecha_nac());%>
                            <td> <%=fecha_nac%></td>
                            <input type="hidden" name="idCliente" value="<%=ID%>">
                        </tr>
                  </tbody>
                </table>
                <h2 class="col-xl-12"><h2 class="tm-text-shadow">Servicios seleccionados</h2>
                <table class="table custom-table">
                  <thead>
                        <tr>  
                            <th scope="col">Nombre</th>
                            <th scope="col">ID</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Destino</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Costo</th>
                        </tr>
                  </thead>
                  <tbody>
                        <%List <Servicio> listaServiciosSeleccionados = (List) misesion.getAttribute("listaServiciosSeleccionados");
                        int i = 0;
                        for (Servicio ser: listaServiciosSeleccionados){
                        %>
                        <tr>
                            
                            <%String nombreSer = ser.getNombre();%>
                            <td> <%=nombreSer%> </td>
                            <% int IDSer = ser.getCodigo_servicio();%>
                            <td> <%=IDSer%></td>
                            <% String descripcion_breve = ser.getDescripcion_breve();%>
                            <td> <%=descripcion_breve%></td>
                            <% String destino_servicio = ser.getDestino_servicio();%>
                            <td> <%=destino_servicio%></td>
                            <% String fecha_servicio= sdf.format(ser.getFecha_servicio());%>
                            <td> <%=fecha_servicio%></td>
                            <% double costo_servicio = ser.getCosto_servicio();%>
                            <td> <%=costo_servicio%></td>
                            <input type="hidden" name="idServicio<%=i%>" value="<%=IDSer%>">
                        </tr>
                  </tbody>
                        
                </table>
                <%i++; }%>
                    <div style="width: 65vw; display: flex; flex-direction: row; justify-content: space-between;">
                        <div> 
                            <h4 class="tm-text-shadow">Medio de pago: <%=medioPago%></h4>
                        </div> 
                        <div> 
                            <h4 class="tm-text-shadow">Costo total: $<%=costo%></h4>
                        </div>
 
                     </div>
                        <input type="hidden" name="medioPago" value="<%=medioPago%>">
                        <input type="hidden" name="costo" value="<%=costo%>">
                        <input type="hidden" id="datePicker" name="fechaVenta" value="">
                <button class="btn tm-btn-submit tm-btn ml-auto" type="submit">Confirmar Venta</button> 
                </form>
            </div>
            </div>
            <script>
                document.getElementById('datePicker').value = new Date().toDateInputValue();
            </script>
                            
    </body>
</html>
