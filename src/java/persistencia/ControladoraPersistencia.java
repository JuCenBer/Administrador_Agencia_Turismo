package persistencia;

import logica.Empleado;
import logica.Usuario;


public class ControladoraPersistencia {
    
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    
    public void crearEmpleado(Empleado emple, Usuario usu){
        usuJPA.create(usu);
        empleJPA.create(emple);
    }
    
}
