package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;


public class ControladoraPersistencia {
    
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    ClienteJpaController cliJPA = new ClienteJpaController();
    ServicioJpaController serJPA = new ServicioJpaController();
    PaqueteJpaController paqJPA = new PaqueteJpaController();
    VentaJpaController venJPA = new VentaJpaController();
    
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
    public void crearServicio(Servicio ser){
        serJPA.create(ser);
    }
    
   
    public Servicio buscarServicio(int id) {
        return serJPA.findServicio(id);
    }

    public List<Servicio> traerServicios() {
        return serJPA.findServicioEntities();
    }

    public void borrarServicio(int id) {
        try {
            serJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarServicio(Servicio ser) {
        try {
            serJPA.edit(ser);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //PAQUETES
    public void crearPaquete(Paquete paq) {
        paqJPA.create(paq);
    }
    public List<Paquete> traerPaquetes() {
        return paqJPA.findPaqueteEntities();
    }
    public void modificarPaquete(Paquete paq) {
        try {
            paqJPA.edit(paq);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarPaquete(int id) {
        try {
            paqJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Paquete buscarPaquete(int id) {
        return paqJPA.findPaquete(id);
    }
    //VENTAS

    public void crearVenta(Venta ven) {
        venJPA.create(ven);
    }

    public List<Venta> traerVentas() {
        return venJPA.findVentaEntities();
    }

    public void borrarVenta(int id) {
        try {
            venJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarPaquete(Venta ven) {
        try {
            venJPA.edit(ven);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Venta buscarVenta(int id) {
        return venJPA.findVenta(id);
    }

    

    //USUARIOS
    public List<Usuario> traerUsuarios(){
        return usuJPA.findUsuarioEntities();
    }

    
    

    
}