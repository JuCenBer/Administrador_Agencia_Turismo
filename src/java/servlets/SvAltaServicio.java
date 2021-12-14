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


@WebServlet(name = "SvAltaServicio", urlPatterns = {"/SvAltaServicio"})
public class SvAltaServicio extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAltaServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAltaServicio at " + request.getContextPath() + "</h1>");
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
        String descripcion_breve = request.getParameter("descripcion");
        String destino_servicio = request.getParameter("destino_servicio");
        String aux = request.getParameter("fecha_servicio");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_servicio = null;
        try {
             fecha_servicio = sdf.parse(aux);
        } catch (ParseException ex) {
            Logger.getLogger(SvAltaServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        double costo_servicio = Double.parseDouble(request.getParameter("costo_servicio"));
        
        control.crearServicio(nombre,descripcion_breve,destino_servicio,fecha_servicio,costo_servicio);
        response.sendRedirect("index.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
