package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;


public class ControladoraPersistencia {
    
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    ClienteJpaController cliJPA = new ClienteJpaController();
    ServicioJpaController SerJPA = new ServicioJpaController();
    
    public void crearEmpleado(Empleado emple, Usuario usu){
        usuJPA.create(usu);
        empleJPA.create(emple);
    }
    
    public List<Empleado> traerEmpleados(){
        return empleJPA.findEmpleadoEntities();
    }

    public void borrarEmpleado(int id) {
        try {
            empleJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

    public Empleado buscarEmpleado(int id) {
        return empleJPA.findEmpleado(id);
    }

    public void modificarEmpleado(Empleado emple) {
        try {
            empleJPA.edit(emple);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //CLIENTES
    public void crearCliente(Cliente cli) {
        cliJPA.create(cli);
    }
    public List<Cliente> traerClientes() {
        return cliJPA.findClienteEntities();
    }

    public void borrarCliente(int id) {
        try {
            cliJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cliente buscarCliente(int id) {
        return cliJPA.findCliente(id);
    }

    public void modificarCliente(Cliente cli) {
        try {
            cliJPA.edit(cli);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //SERVICIOS
    public void crearServicio(){
        
    }
    
    //PAQUETES
    
    //VENTAS
}