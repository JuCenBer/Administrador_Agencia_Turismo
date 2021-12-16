package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Venta;

@WebServlet(name = "SvModificarVenta", urlPatterns = {"/SvModificarVenta"})
public class SvModificarVenta extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarVenta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarVenta at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        Venta ven = control.buscarVenta(id);
        if (ven.getPaque() == null) {
           HttpSession misesion = request.getSession();
            misesion.setAttribute("listaClientes", control.traerClientes());
            misesion.setAttribute("listaServicios", control.traerServicios());
            misesion.setAttribute("ven", ven);
            response.sendRedirect("modificarVentaServicio.jsp"); 
        }else if (ven.getServi() == null) {
            HttpSession misesion = request.getSession();
            misesion.setAttribute("listaClientes", control.traerClientes());
            misesion.setAttribute("listaPaquetes", control.traerPaquetes());
            misesion.setAttribute("ven", ven);
            response.sendRedirect("modificarVentaPaquete.jsp");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
