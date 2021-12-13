package logica;

import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearEmpleado(String nombre, String apellido, Date fecha_nac, String direccion, String dni, String cargo, double sueldo, int celular, String email, String nacionalidad, String nombreUsu, String contrasenia) {
        Empleado emple = new Empleado();
        Usuario usu = new Usuario();
        
        
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setDireccion(direccion);
        emple.setNacionalidad(nacionalidad);
        emple.setCargo(cargo);
        emple.setSueldo(sueldo);
        emple.setCelular(celular);
        emple.setDni(dni);
        emple.setFecha_nac(fecha_nac);
        emple.setEmail(email);
        
        usu.setNombreUsu(nombreUsu);
        usu.setContrasenia(contrasenia);
        
        emple.setUsu(usu);
        
        controlPersis.crearEmpleado(emple,usu);
    }   
    
    public List<Empleado> traerEmpleados(){
        return controlPersis.traerEmpleados();
    }
}
