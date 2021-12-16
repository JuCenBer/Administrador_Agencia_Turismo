package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;
import logica.Servicio;
import logica.Venta;

@WebServlet(name = "SvModificarVentaServicio", urlPatterns = {"/SvModificarVentaServicio"})
public class SvModificarVentaServicio extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarVentaServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarVentaServicio at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("idVenta"));
        Venta ven = control.buscarVenta(id);
        
        Cliente cli = new Cliente();
        List<Cliente> listaClientes = control.traerClientes();
        for (int i = 0; i < (listaClientes.size()); i++) {
            if(listaClientes.get(i).isHabilitado()){
                id = 0;
                try{
                    id = Integer.parseInt(request.getParameter("Clicheckbox"+String.valueOf(i)));
                }
                catch(Exception ex){

                }
                System.out.println(i);
                if (id != 0) {
                   cli = control.buscarCliente(id);
                }
            }
        } 
        
        double costo = 0;
        Servicio ser = new Servicio();
        List<Servicio> listaServicios = control.traerServicios();
        List<Servicio> listaServiciosSeleccionados = new ArrayList<Servicio>();
        for (int i = 0; i < (listaServicios.size()); i++) {
            if(listaServicios.get(i).isHabilitado()){

                id = 0;
                try{
                    id = Integer.parseInt(request.getParameter("Sercheckbox"+String.valueOf(i)));
                }
                catch(Exception ex){

                }
                if (id != 0) {
                   ser = control.buscarServicio(id);
                   costo += ser.getCosto_servicio();
                   listaServiciosSeleccionados.add(ser);
                }
            }
        }
        String medioPago = request.getParameter("medio_pago");
        System.out.println("el medio de pago es " + medioPago);
        switch(medioPago){
            case "Tarjeta de Debito": costo+= costo*0.03;
                                                    break;
            case "Tarjeta de Credito": costo+= costo*0.09;
                                                     break;
            case "Transferencia": costo+= costo*0.0245;
                                                    break;
            default: break;
        }
        ven.setCli(cli);
        ven.setServi(ser);
        ven.setMedio_pago(medioPago);
        ven.setCosto(costo);
        control.modificarVenta(ven);
        request.getSession().setAttribute("listaVentas", control.traerVentas());
        response.sendRedirect("listadoVentas.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
