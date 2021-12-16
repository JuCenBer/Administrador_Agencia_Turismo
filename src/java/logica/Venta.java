package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Venta implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int num_venta;
    
    @Basic
    private Date fecha_venta;
    private String medio_pago;
    private Cliente cli;
    private Empleado emple;
    private Servicio servi;
    private Paquete paque;

    
    public Venta() {
    }

    public Venta(int num_venta, Date fecha_venta, String medio_pago, Cliente cli, Empleado emple, Servicio servi, Paquete paque) {
        this.num_venta = num_venta;
        this.fecha_venta = fecha_venta;
        this.medio_pago = medio_pago;
        this.cli = cli;
        this.emple = emple;
        this.servi = servi;
        this.paque = paque;
    }
    
    public int getNum_venta() {
        return num_venta;
    }

    public void setNum_venta(int num_venta) {
        this.num_venta = num_venta;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getMedio_pago() {
        return medio_pago;
    }

    public void setMedio_pago(String medio_pago) {
        this.medio_pago = medio_pago;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }

    public Empleado getEmple() {
        return emple;
    }

    public void setEmple(Empleado emple) {
        this.emple = emple;
    }

    public Servicio getServi() {
        return servi;
    }

    public void setServi(Servicio servi) {
        this.servi = servi;
    }

    public Paquete getPaque() {
        return paque;
    }

    public void setPaque(Paquete paque) {
        this.paque = paque;
    }
    
    
}
