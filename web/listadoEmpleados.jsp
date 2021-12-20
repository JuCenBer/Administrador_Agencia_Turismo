<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Empleados</title>
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
                            <th scope="col">Empleados</th>
                            <th scope="col">ID</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Cargo</th>
                            <th scope="col">Sueldo</th>
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
                        List <Empleado> listaEmpleados = (List) request.getSession().getAttribute("listaEmpleados");
                        for (Empleado emple: listaEmpleados){
                            if (emple.isHabilitado()) {
                        %>
                        <tr>
                            <%String nombre = emple.getNombre() + " " + emple.getApellido();%>
                            <td> <%=nombre%> </td>
                            <% int ID = emple.getId_empleado();%>
                            <td> <%=ID%></td>
                            <% String DNI = emple.getDni();%>
                            <td> <%=DNI%></td>
                            <% String Cargo = emple.getCargo();%>
                            <td> <%=Cargo%></td>
                            <% double sueldo= emple.getSueldo();%>
                            <td> <%=sueldo%></td>
                            <% int celular = emple.getCelular();%>
                            <td> <%=celular%></td>
                            <% String Email = emple.getEmail();%>
                            <td> <%=Email%></td>
                            <% String nacionalidad = emple.getNacionalidad();%>
                            <td> <%=nacionalidad%></td>
                            <% String direccion = emple.getDireccion();%>
                            <td> <%=direccion%></td>
                            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String fecha_nac = sdf.format(emple.getFecha_nac());%>
                            <td> <%=fecha_nac%></td>
                            <td>
                                <form name="formBorrarEmpleado" action="SvEliminarEmpleado" method="post">
                                    <input type="hidden" name="id" value="<%=ID%>">
                                    <button type="submit" class="btn-danger">Eliminar</button>
                                </form>
                                <form name="formModificarEmpleado" action="SvModificarEmpleado" method="post">
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
    </body>
</html>
