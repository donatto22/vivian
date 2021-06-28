package beans;

import java.io.Serializable;

public class Productos implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int idProducto, reparto, stock, idCategoria;	
	private String producto, moneda, categoria;
	private double precio;
	
	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	
	public Productos() {}
	
	public Productos(String moneda, String producto, Double precio, String categoria, int stock, int reparto) {
		this.producto = producto;
		this.moneda = moneda;
		this.precio = precio;
		this.categoria = categoria;
		this.stock = stock;
		this.reparto = reparto;
	}
	
	public int getIdProducto() {
		return idProducto;
	}
	
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	
	public int getReparto() {
		return reparto;
	}
	
	public void setReparto(int reparto) {
		this.reparto = reparto;
	}
	
	public int getStock() {
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getProducto() {
		return producto;
	}
	
	public void setProducto(String producto) {
		this.producto = producto;
	}
	
	public String getMoneda() {
		return moneda;
	}
	
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	
	public String getCategoria() {
		return categoria;
	}
	
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	public Double getPrecio() {
		return precio;
	}
	
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	
	
	
}
