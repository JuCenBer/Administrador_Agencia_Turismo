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
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvModificarCliente", urlPatterns = {"/SvModificarCliente"})
public class SvModificarCliente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarCliente at " + request.getContextPath() + "</h1>");
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
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        Date fecha_nac = null;
        try {
            fecha_nac = sdf.parse(aux);
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleadoAlta.class.getName()).log(Level.SEVERE, null, ex);
        }
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        int celular = Integer.parseInt(request.getParameter("celular"));
        
        
        Cliente cli = control.buscarCliente(id);
        cli.setNombre(nombre);
        cli.setApellido(apellido);
        cli.setNacionalidad(nacionalidad);
        cli.setEmail(email);
        cli.setFecha_nac(fecha_nac);
        cli.setDireccion(direccion);
        cli.setDni(dni);
        cli.setCelular(celular);
        
        control.modificarCliente(cli);
        
        request.getSession().setAttribute("listaClientes", control.traerClientes());
        response.sendRedirect("listadoClientes.jsp");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cli = control.buscarCliente(id);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("cli", cli);
        response.sendRedirect("modificarCliente.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
