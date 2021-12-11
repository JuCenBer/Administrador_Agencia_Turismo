package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Paquete implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int idPaquete;
    @Basic
    private double costo_paquete;
    @ManyToMany
    private List<Servicio> lista_servicios_incluidos;
    @OneToMany
    private List<Venta> listaVentas;

    public Paquete() {
    }

    public Paquete(int idPaquete, double costo_paquete, List<Servicio> lista_servicios_incluidos, List<Venta> listaVentas) {
        this.idPaquete = idPaquete;
        this.costo_paquete = costo_paquete;
        this.lista_servicios_incluidos = lista_servicios_incluidos;
        this.listaVentas = listaVentas;
    }

    public int getIdPaquete() {
        return idPaquete;
    }

    public void setIdPaquete(int idPaquete) {
        this.idPaquete = idPaquete;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<Servicio> getLista_servicios_incluidos() {
        return lista_servicios_incluidos;
    }

    public void setLista_servicios_incluidos(List<Servicio> lista_servicios_incluidos) {
        this.lista_servicios_incluidos = lista_servicios_incluidos;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }
    
    
    
}
