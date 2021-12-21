<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Venta"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
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
                <input type="text"  id="myInput" class="form-control" onkeyup="myFunction()" placeholder="Buscar por fecha">
                <table class="table custom-table" id="myTable">
                  <thead>
                        <tr>  
                            <th scope="col">Fecha</th>
                            <th scope="col">Recaudacion total</th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        List <Venta> listaVentas = (List) request.getSession().getAttribute("listaVentas");; 
                        int mesAct=0;
                        int diaAct=0;
                        int anioAct=0;
                        Venta ven1 = listaVentas.get(0);
                        Date fecha = ven1.getFecha_venta();
                        LocalDate fechaLocal = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                        double sum = 0;
                        mesAct = fechaLocal.getMonthValue();
                        diaAct = fechaLocal.getDayOfMonth();
                        anioAct = fechaLocal.getYear();
                        for (Venta ven: listaVentas){
                            fecha = ven.getFecha_venta();
                            fechaLocal = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                           
                            if ((fechaLocal.getMonthValue() == mesAct) && (fechaLocal.getDayOfMonth() == diaAct) && (fechaLocal.getYear() == anioAct)) {
                                sum += ven.getCosto();
                            }else{
                        %>
                        <tr>
                            <%String aux = (String.valueOf(diaAct) +"-"+String.valueOf(mesAct)+"-"+String.valueOf(anioAct));%>
                            <td> <%=aux%> </td>
                            <td> $ <%=sum%></td>
                        </tr>
                        <%  mesAct = fechaLocal.getMonthValue();
                        diaAct = fechaLocal.getDayOfMonth();
                        anioAct = fechaLocal.getYear();
                        sum = ven.getCosto();}
                        }%>
                        <tr>
                            <%String aux = (String.valueOf(diaAct) +"-"+String.valueOf(mesAct)+"-"+String.valueOf(anioAct));%>
                            <td> <%=aux%> </td>
                            <td> $ <%=sum%></td>
                        </tr>
                  </tbody>
                     
                </table>
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
                    td = tr[i].getElementsByTagName("td")[0];
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
    </body>
        <%}%>
</html>
