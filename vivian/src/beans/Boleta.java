package beans;

import java.io.Serializable;

public class Boleta implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int idUsuario, nombresUsuario, idProducto,idPedido, idPago, cantidadTotal, monto;
	private String fechaRegistro, nombreProducto;
	
	public Boleta() {}
	

	public Boleta(int idUsuario, int nombresUsuario, int idProducto, int idPedido, int idPago, 
					int cantidadTotal, int monto, String fechaRegistro, String nombreProducto) {
		
		this.idUsuario = idUsuario;
		this.nombresUsuario = nombresUsuario;
		this.idProducto = idProducto;
		this.idPedido = idPedido;
		this.idPago = idPago;
		this.cantidadTotal = cantidadTotal;
		this.monto = monto;
		this.fechaRegistro = fechaRegistro;
		this.nombreProducto = nombreProducto;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getNombresUsuario() {
		return nombresUsuario;
	}

	public void setNombresUsuario(int nombresUsuario) {
		this.nombresUsuario = nombresUsuario;
	}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getIdPago() {
		return idPago;
	}

	public void setIdPago(int idPago) {
		this.idPago = idPago;
	}

	public int getCantidadTotal() {
		return cantidadTotal;
	}

	public void setCantidadTotal(int cantidadTotal) {
		this.cantidadTotal = cantidadTotal;
	}

	public int getMonto() {
		return monto;
	}

	public void setMonto(int monto) {
		this.monto = monto;
	}

	public String getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	
}
