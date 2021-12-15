package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvModificarPaquete", urlPatterns = {"/SvModificarPaquete"})
public class SvModificarPaquete extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarPaquete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarPaquete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPaq = Integer.parseInt(request.getParameter("id"));
        double costo = 0;
        Servicio ser = new Servicio();
        List<Servicio> listaServicios = control.traerServicios();
        Paquete paq = control.buscarPaquete(idPaq);
        paq.limpiarListaServicios();
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
        control.modificarPaquete(paq);
        
        request.getSession().setAttribute("listaPaquetes", control.traerPaquetes());
        response.sendRedirect("listadoPaquetes.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Paquete paq = control.buscarPaquete(id);
        List <Servicio> listaServicios = control.traerServicios();
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaServicios", listaServicios);
        misesion.setAttribute("paq", paq);
        response.sendRedirect("modificarPaquete.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
