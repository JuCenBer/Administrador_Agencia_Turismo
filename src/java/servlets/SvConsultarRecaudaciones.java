package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Venta;

@WebServlet(name = "SvConsultarRecaudaciones", urlPatterns = {"/SvConsultarRecaudaciones"})
public class SvConsultarRecaudaciones extends HttpServlet {
  
    Controladora control = new Controladora();
    Date date = new Date();
    LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    int month = localDate.getMonthValue();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvConsultarRecaudaciones</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvConsultarRecaudaciones at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Venta> listaVentas = control.traerVentas();        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaVentas", listaVentas);
        response.sendRedirect("listadoRecaudacionesMes.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Venta> listaVentas = control.traerVentas();
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaVentas", listaVentas);
        response.sendRedirect("listadoRecaudacionesDia.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
