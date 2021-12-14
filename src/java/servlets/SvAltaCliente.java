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
import logica.Controladora;

@WebServlet(name = "SvAltaCliente", urlPatterns = {"/SvAltaCliente"})
public class SvAltaCliente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAltaCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAltaCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nacionalidad = request.getParameter("nacionalidad");
        String email = request.getParameter("email");
        String aux = request.getParameter("fecha_nac");
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); 
        Date fecha_nac = null;
        try {
            fecha_nac = formato.parse(aux);
        } catch (ParseException ex) {
            Logger.getLogger(SvAltaCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        int celular = Integer.parseInt(request.getParameter("celular"));
        
        control.crearCliente(nombre, apellido, fecha_nac, direccion, dni, celular, email, nacionalidad);
        
        response.sendRedirect("index.jsp"); //redireccionamiento a la pagina principal
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
