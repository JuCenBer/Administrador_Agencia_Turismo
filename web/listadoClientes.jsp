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
        <div class="container">
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">

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
                            <th scope="col"></th>
                            <th scopte="col"></th>
                        </tr>
                  </thead>
                  <tbody>
                        <% HttpSession misesion = request.getSession() ;
                        List <Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
                        for (Cliente cli: listaClientes){
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
                            <% Date fecha_nac = cli.getFecha_nac();%>
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
                        <%}%>
                </table>
            </div>
            </div>
            
    </body>
</html>
