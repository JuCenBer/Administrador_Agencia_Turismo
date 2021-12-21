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

@WebServlet(name = "SvAltaVentaServicio", urlPatterns = {"/SvAltaVentaServicio"})
public class SvAltaVentaServicio extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAltaVentaServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAltaVentaServicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> listaClientes = control.traerClientes();
        List<Servicio> listaServicios = control.traerServicios();
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaClientes", listaClientes);
        misesion.setAttribute("listaServicios", listaServicios);
        response.sendRedirect("crearVentaServicios.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente cli = new Cliente();
        List<Cliente> listaClientes = control.traerClientes();
        boolean activado = false;
        int id = 0;
        if (request.getParameter("Clicheckbox") == null) {
            response.sendRedirect("crearVentaServicios.jsp");
        }else{
                id = Integer.parseInt(request.getParameter("Clicheckbox"));
            if (id != 0) {
            cli = control.buscarCliente(id);     
            }   


            double costo = 0;
            Servicio ser = new Servicio();
            List<Servicio> listaServicios = control.traerServicios();
            List<Servicio> listaServiciosSeleccionados = new ArrayList<Servicio>();
            int j = 0;
            for (int i = 0; i < (listaServicios.size()); i++) {
                
                if(listaServicios.get(i).isHabilitado()){
                    
                    id = 0;
                    try{
                        id = Integer.parseInt(request.getParameter("Sercheckbox"+String.valueOf(j)));
                    }
                    catch(Exception ex){

                    }
                    if (id != 0) {
                       activado = true;
                       ser = control.buscarServicio(id);
                       costo += ser.getCosto_servicio();
                       listaServiciosSeleccionados.add(ser);
                    }
                    j++;
                }
            }
            if(activado == false){
                response.sendRedirect("crearVentaServicios.jsp");
            }else{
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
                misesion.setAttribute("listaServiciosSeleccionados", listaServiciosSeleccionados);
                misesion.setAttribute("cli", cli);
                misesion.setAttribute("costo", costo);
                misesion.setAttribute("medioPago", medioPago);
                response.sendRedirect("confirmarVentaServicio.jsp");
            }
        }
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
