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
import logica.Cliente;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvAltaVentaPaquete", urlPatterns = {"/SvAltaVentaPaquete"})
public class SvAltaVentaPaquete extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAltaVentaPaquete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAltaVentaPaquete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> listaClientes = control.traerClientes();
        List<Paquete> listaPaquetes = control.traerPaquetes();
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaClientes", listaClientes);
        misesion.setAttribute("listaPaquetes", listaPaquetes);
        response.sendRedirect("crearVentaPaquete.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente cli = new Cliente();
        List<Cliente> listaClientes = control.traerClientes();
        int id = 0;
        id = Integer.parseInt(request.getParameter("Clicheckbox"));
        if (id != 0) {
            cli = control.buscarCliente(id);
        }

        double costo = 0;
        Paquete paq = new Paquete();
        List<Paquete> listaPaquetes = control.traerPaquetes();
        id = 0;    
        id = Integer.parseInt(request.getParameter("Paqcheckbox"));
        if (id != 0) {
            paq = control.buscarPaquete(id);
            costo += paq.getCosto_paquete();
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
        HttpSession misesion = request.getSession();
        misesion.setAttribute("paq", paq);
        misesion.setAttribute("cli", cli);
        misesion.setAttribute("costo", costo);
        misesion.setAttribute("medioPago", medioPago);
        response.sendRedirect("confirmarVentaPaquete.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
