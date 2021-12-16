package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
import logica.Paquete;
import logica.Venta;

@WebServlet(name = "SvModificarVentaPaquete", urlPatterns = {"/SvModificarVentaPaquete"})
public class SvModificarVentaPaquete extends HttpServlet {

   
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvModificarVentaPaquete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvModificarVentaPaquete at " + request.getContextPath() + "</h1>");
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
        Paquete paq = new Paquete();
        List<Paquete> listaPaquetes = control.traerPaquetes();
        for (int i = 0; i < (listaPaquetes.size()); i++) {
            if(listaPaquetes.get(i).isHabilitado()){
                id = 0;
                try{
                    id = Integer.parseInt(request.getParameter("Paqcheckbox"+String.valueOf(i)));
                }
                catch(Exception ex){

                }
                if (id != 0) {
                   paq = control.buscarPaquete(id);
                   costo += paq.getCosto_paquete();
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
        ven.setPaque(paq);
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
