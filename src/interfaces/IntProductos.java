package interfaces;

import java.util.ArrayList;

import beans.Productos;

public interface IntProductos {

	public boolean registrar(Productos p);
	
	public boolean actualizar(Productos p);
	
	public boolean eliminar(Productos p);
	
	public ArrayList<Productos> listar(String categoria, String moneda);
	
	public Productos getProducto(int id);
	
}
