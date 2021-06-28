package interfaces;

import java.util.ArrayList;

import beans.Reservas;

public interface IntReservas {

	public boolean registrar(Reservas r);
	
	public boolean actualizar(Reservas r, String reservacion, String mesa, String fecha, String turno);
	
	public boolean eliminar(Reservas r);
	
	public ArrayList<Reservas> VerificarMesas(String nombre);
	
	public ArrayList<Reservas> listarReservas(int codigo);
	
}
