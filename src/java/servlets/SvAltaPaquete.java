package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvAltaPaquete", urlPatterns = {"/SvAltaPaquete"})
public class SvAltaPaquete extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAltaPaquete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAltaPaquete at " + request.getContextPath() + "</h1>");
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
        double costo = 0;
        Paquete paq = new Paquete();
        Servicio ser = new Servicio();
        List<Servicio> listaServicios = control.traerServicios();
        for (int i = 0; i < (listaServicios.size()); i++) {
            int id = 0;
            
            try{
                id = Integer.parseInt(request.getParameter("checkbox"+String.valueOf(i)));
            }
            catch(Exception ex){
                
            }
            System.out.println(i);
            if (id != 0) {
               ser = control.buscarServicio(id);
               costo += ser.getCosto_servicio();
               paq.add(ser);
            }
        }
        costo -= costo*0.1; 
        paq.setCosto_paquete(costo);
        
        control.crearPaquete(paq);
        response.sendRedirect("index.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
