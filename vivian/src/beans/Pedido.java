package beans;

import java.time.LocalDate;
import java.util.List;

public class Pedido {
	private int id;
	private int idcliente;
	private int idpago;
	private LocalDate fecha;
	private double monto;
	private String estado;
	
	private List<Carrito>detallecompras;

	public Pedido() {}

	public Pedido(int idcliente, int idpago, LocalDate fecha, double monto, String estado,
			List<Carrito> detallecompras) {
		this.idcliente = idcliente;
		this.idpago = idpago;
		this.fecha = fecha;
		this.monto = monto;
		this.estado = estado;
		this.detallecompras = detallecompras;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public int getIdpago() {
		return idpago;
	}

	public void setIdpago(int idpago) {
		this.idpago = idpago;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public List<Carrito> getDetallecompras() {
		return detallecompras;
	}

	public void setDetallecompras(List<Carrito> detallecompras) {
		this.detallecompras = detallecompras;
	}
	
	
}
