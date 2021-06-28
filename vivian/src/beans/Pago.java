package beans;

public class Pago {
	private int id;
	private double monto;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public Pago( double monto) {
		this.monto = monto;
	}
}
