<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Cliente"%>
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
                <input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Buscar por DNI">
                <table class="table custom-table" id="myTable">
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
                            <th scope="col"></th>
                            <th scopte="col"></th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        List <Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String fecha_nac;
                        for (Cliente cli: listaClientes){
                            if (cli.isHabilitado()) {
                        %>
                        <tr>
                            <%String nombre = cli.getNombre() + " " + cli.getApellido();%>
                            <td> <%=nombre%> </td>
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
                            <% fecha_nac = sdf.format(cli.getFecha_nac());%>
                            <td> <%=fecha_nac%></td>
                            <td>
                                <form name="formBorrarCliente" action="SvEliminarCliente" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-danger">Eliminar</button>
                                </form>
                                <form name="formModificarCliente" action="SvModificarCliente" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-light">Modificar</button> 
                                </form>
                            </td>
                            <td></td>
                        </tr>
                  </tbody>
                        <%}}%>
                </table>
            </div>
            </div>
            <%}%>
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
                    td = tr[i].getElementsByTagName("td")[2];
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
</html>
