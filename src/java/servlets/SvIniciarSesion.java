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
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvIniciarSesion", urlPatterns = {"/SvIniciarSesion"})
public class SvIniciarSesion extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvIniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvIniciarSesion at " + request.getContextPath() + "</h1>");
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
        
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        boolean autorizado = control.verificarUsuario(usuario,contrasenia);
        if(autorizado == true){
            HttpSession misesion = request.getSession(true);
            int id = 0;
            List<Empleado> listaEmpleados = control.traerEmpleados();
            for (Empleado emple: listaEmpleados) {
                Usuario usu = emple.getUsu();
                if((usu.getNombreUsu().equals(usuario)) && (usu.getContrasenia().equals(contrasenia))){
                    id = emple.getId_empleado();
                    break;
                }
            }
            misesion.setAttribute("idEmpleado", id);
            misesion.setAttribute("usuario", usuario);
            misesion.setAttribute("contrasenia", contrasenia);
            
            response.sendRedirect("index.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
