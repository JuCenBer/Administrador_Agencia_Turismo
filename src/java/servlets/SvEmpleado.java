package servlets;

import java.io.IOException;
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
import logica.Controladora;

@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nacionalidad = request.getParameter("nacionalidad");
        String email = request.getParameter("email");
        String aux = request.getParameter("fecha_nac");
        SimpleDateFormat sdf = new SimpleDateFormat("MM-DD-YYYY");
        Date fecha_nac = null;
        try {
            fecha_nac = sdf.parse(aux);
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String cargo = request.getParameter("cargo");
        int celular = Integer.parseInt(request.getParameter("celular"));
        double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String nombreUsu = request.getParameter("nombreUsu");
        String contrasenia = request.getParameter("contrasenia");
        
        control.crearEmpleado(nombre, apellido, fecha_nac, direccion, dni, cargo, sueldo, celular, email, nacionalidad, nombreUsu, contrasenia);
        
        response.sendRedirect("index.jsp"); //redireccionamiento a la pagina principal
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
