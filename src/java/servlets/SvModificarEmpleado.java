package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvModificarEmpleado", urlPatterns = {"/SvModificarEmpleado"})
public class SvModificarEmpleado extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarEmpleado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarEmpleado at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nacionalidad = request.getParameter("nacionalidad");
        String email = request.getParameter("email");
        String aux = request.getParameter("fecha_nac");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_nac = null;
        try {
            fecha_nac = sdf.parse(aux);
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleadoAlta.class.getName()).log(Level.SEVERE, null, ex);
        }
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String cargo = request.getParameter("cargo");
        int celular = Integer.parseInt(request.getParameter("celular"));
        double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String nombreUsu = request.getParameter("nombreUsu");
        String contrasenia = request.getParameter("contrasenia");
        
        Empleado emple = control.buscarEmpleado(id);
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setNacionalidad(nacionalidad);
        emple.setEmail(email);
        emple.setFecha_nac(fecha_nac);
        emple.setDireccion(direccion);
        emple.setDni(dni);
        emple.setCargo(cargo);
        emple.setCelular(celular);
        emple.setSueldo(sueldo);
        
        Usuario usu = new Usuario();
        usu.setNombreUsu(nombreUsu);
        usu.setContrasenia(contrasenia);
        emple.setUsu(usu);
        control.modificarEmpleado(emple);
        
        request.getSession().setAttribute("listaEmpleados", control.traerEmpleados());
        response.sendRedirect("listadoEmpleados.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Empleado emple = control.buscarEmpleado(id);
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("emple", emple);
        response.sendRedirect("modificarEmpleado.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
