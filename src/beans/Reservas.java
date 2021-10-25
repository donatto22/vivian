package beans;

import java.io.Serializable;

public class Reservas implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int idCliente, piso;
	private String fecha, idReserva, idTurno, numeroMesa, descripcionTurno;
	
	public Reservas() {}

	public Reservas(String numeroMesa, int idCliente, String fecha, String idTurno) {
		this.numeroMesa = numeroMesa;
		this.idCliente = idCliente;
		this.fecha = fecha;
		this.idTurno = idTurno;
	}	
	
	public String getNumeroMesa() {
		return numeroMesa;
	}
	
	public void setNumeroMesa(String numeroMesa) {
		this.numeroMesa = numeroMesa;
	}
	
	public int getIdCliente() {
		return idCliente;
	}
	
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	
	public String getFecha() {
		return fecha;
	}
	
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public String getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(String idReserva) {
		this.idReserva = idReserva;
	}

	public String getIdTurno() {
		return idTurno;
	}

	public void setIdTurno(String idTurno) {
		this.idTurno = idTurno;
	}

	public String getDescripcionTurno() {
		return descripcionTurno;
	}

	public void setDescripcionTurno(String descripcionTurno) {
		this.descripcionTurno = descripcionTurno;
	}
	
	
}
