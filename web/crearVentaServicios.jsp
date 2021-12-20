<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
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

	<title>Alta Venta</title>

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
        <div class="container">
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione el cliente</h2></header>
                <input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Buscar por DNI">
                <form name="formCrearVentaServicio" action="SvAltaVentaServicio" method="post">
                 <table class="table custom-table" id="myTable">
                  <thead>
                        <tr>  
                            <th scope="col"></th>
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
                        <%
                        int j = 0;
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String fecha_nac;
                        List <Cliente> listaClientes = (List) misesion.getAttribute("listaClientes");
                        for (Cliente cli: listaClientes){
                            if (cli.isHabilitado()) {
                        %>
                        <tr>
                            <% int ID = cli.getId_cliente();%>
                            <td><input name="Clicheckbox<%=j%>" type="radio" value="<%=ID%>"></td>
                            <%String nombre = cli.getNombre() + " " + cli.getApellido();%>
                            <td> <%=nombre%> </td>
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
                            <% fecha_nac = sdf.format(cli.getFecha_nac());%>
                            <td> <%=fecha_nac%></td>
                        </tr>
                  </tbody>
                        <%}}%>
                </table>
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione los servicios a vender</h2></header>
                <input type="text" class="form-control" id="myInput1" onkeyup="myFunction1()" placeholder="Buscar por nombre de servicio">
                <table class="table custom-table" id="myTable1">
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
                        <% int i = 0;
                        List <Servicio> listaServicios = (List) misesion.getAttribute("listaServicios");
                        for (Servicio ser: listaServicios){
                            if(ser.isHabilitado()){
                        %>
                        <tr>
                            <% double costo_servicio = ser.getCosto_servicio();%>
                            <% int ID = ser.getCodigo_servicio();%>
                            <td><input name="Sercheckbox<%=i%>" type="checkbox" value="<%=ID%>"></td>
                            <%String nombre = ser.getNombre();%>
                            <td> <%=nombre%> </td>
                            <td> <%=ID%></td>
                            <% String descripcion_breve = ser.getDescripcion_breve();%>
                            <td> <%=descripcion_breve%></td>
                            <% String destino_servicio = ser.getDestino_servicio();%>
                            <td> <%=destino_servicio%></td>
                            <% String fecha_servicio= sdf.format(ser.getFecha_servicio());%>
                            <td> <%=fecha_servicio%></td>
                            <td> <%=costo_servicio%></td>
                        </tr>
                        <%i++; }}%>
                  </tbody> 
                </table>
                <h2 class="tm-text-shadow">Seleccione el metodo de pago</h2>
                <ul>
                    <li><label for="Efectivo"><input type="radio" value="Efectivo" name="medio_pago" checked>   Efectivo</label></li>
                    <li><label for="Tarjeta de Debito (3% comision)"><input value="Tarjeta de Debito" type="radio" name="medio_pago">   Tarjeta de Debito (3% comision) </label></li>
                    <li><label for="Tarjeta de Credito (9% comision)"><input  value="Tarjeta de Credito" type="radio" name="medio_pago">    Tarjeta de Credito (9% comision)</label></li>
                    <li><label for="Monedero Virtual"><input " type="radio" value="Monedero Virtual" name="medio_pago"> Monedero Virtual</label></li>
                    <li><label for="Transferencia (2.45% comision)"><input value="Transferencia" type="radio" name="medio_pago">    Transferencia (2.45% comision)</label></li>
                </ul>        
                    <button id="Button" class="btn tm-btn-submit tm-btn ml-auto" type="submit" >Siguiente</button> 
                </form>
            </div>  
            </div>
            <script>       
                
                
                function myFunction() {
                  // Declare variables
                  var input, filter, table, tr, td, i, txtValue;
                  input = document.getElementById("myInput");
                  filter = input.value.toUpperCase();
                  table = document.getElementById("myTable");
                  tr = table.getElementsByTagName("tr");

                  // Loop through all table rows, and hide those who don't match the search query
                  for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[3];
                    if (td) {
                      txtValue = td.textContent || td.innerText;
                      if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                      } else {
                        tr[i].style.display = "none";
                      }
                    }
                  }
                }
                
                function myFunction1() {
                  // Declare variables
                  var input, filter, table, tr, td, i, txtValue;
                  input = document.getElementById("myInput1");
                  filter = input.value.toUpperCase();
                  table = document.getElementById("myTable1");
                  tr = table.getElementsByTagName("tr");

                  // Loop through all table rows, and hide those who don't match the search query
                  for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                      txtValue = td.textContent || td.innerText;
                      if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                      } else {
                        tr[i].style.display = "none";
                      }
                    }
                  }
                }
        </script>      
        <%}%>
    </body>
</html>
