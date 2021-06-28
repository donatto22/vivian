package beans;

import java.io.Serializable;

public class Mesas implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int piso, nMesa, capacidad;
	
	public Mesas() {}
	
	public Mesas(int piso, int nMesa, int capacidad) {
		this.piso = piso;
		this.nMesa = nMesa;
		this.capacidad = capacidad;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public int getnMesa() {
		return nMesa;
	}

	public void setnMesa(int nMesa) {
		this.nMesa = nMesa;
	}

	public int getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	
	
}
