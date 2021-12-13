package persistencia;

import java.util.List;
import logica.Empleado;
import logica.Usuario;


public class ControladoraPersistencia {
    
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    
    public void crearEmpleado(Empleado emple, Usuario usu){
        usuJPA.create(usu);
        empleJPA.create(emple);
    }
    
    public List<Empleado> traerEmpleados(){
        return empleJPA.findEmpleadoEntities();
    }
}
