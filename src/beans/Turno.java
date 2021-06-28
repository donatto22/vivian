package beans;

import java.io.Serializable;

public class Turno implements Serializable {

	private static final long serialVersionUID = 1L;
		
	private String descripcion, idTurno;
	
	public Turno() {}
	
	public Turno(String idTurno, String descripcion) {
		this.idTurno = idTurno;
		this.descripcion = descripcion;
	}
	
	public String getIdTurno() {
		return idTurno;
	}
	public void setIdTurno(String idTurno) {
		this.idTurno = idTurno;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
