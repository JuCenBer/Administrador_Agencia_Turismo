package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
import logica.Servicio;
import logica.Venta;

@WebServlet(name = "SvConfirmarVentaServicio", urlPatterns = {"/SvConfirmarVentaServicio"})
public class SvConfirmarVentaServicio extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvConfirmarVentaServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvConfirmarVentaServicio at " + request.getContextPath() + "</h1>");
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
        
        int id = Integer.parseInt(request.getParameter("idCliente"));
        Cliente cli = control.buscarCliente(id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        double costo = Double.parseDouble(request.getParameter("costo"));
        String metodoPago = request.getParameter("medioPago");
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Empleado emple = control.buscarEmpleado(idEmpleado);
        Servicio ser = new Servicio();
        List<Servicio> listaServicios = control.traerServicios();
        LocalDateTime now = LocalDateTime.now(); 
        String aux = String.valueOf(now);
        for (int i = 0; i < (listaServicios.size()); i++) {
            id = 0;
            if(listaServicios.get(i).isHabilitado()){
                try{
                    id = Integer.parseInt(request.getParameter("idServicio"+String.valueOf(i)));
                }
                catch(Exception ex){

                }
                if (id != 0) {
                   Venta ven = new Venta();
                   ser = control.buscarServicio(id);
                   ven.setCosto(costo);
                   ven.setCli(cli);
                   ven.setMedio_pago(metodoPago);
                   ven.setServi(ser);
                   ven.setEmple(emple);
                    try {
                        ven.setFecha_venta(sdf.parse(aux));
                    } catch (ParseException ex) {
                        Logger.getLogger(SvConfirmarVentaServicio.class.getName()).log(Level.SEVERE, null, ex);
                    }
                   control.crearVenta(ven);
                }
            }
        }
        
        response.sendRedirect("index.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
