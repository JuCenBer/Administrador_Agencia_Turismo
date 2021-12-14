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
import logica.Servicio;


@WebServlet(name = "SvModificarServicio", urlPatterns = {"/SvModificarServicio"})
public class SvModificarServicio extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarServicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion_breve = request.getParameter("descripcion_breve");
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
        
        
        Servicio ser = control.buscarServicio(id);
        ser.setNombre(nombre);
        ser.setDescripcion_breve(descripcion_breve);
        ser.setDestino_servicio(destino_servicio);
        ser.setFecha_servicio(fecha_servicio);
        ser.setCosto_servicio(costo_servicio);
                
        control.modificarServicio(ser);
        
        request.getSession().setAttribute("listaServicios", control.traerServicios());
        response.sendRedirect("listadoServicios.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Servicio ser = control.buscarServicio(id);
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("ser", ser);
        response.sendRedirect("modificarServicio.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
