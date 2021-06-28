package dao;

import interfaces.*;

public abstract class DaoFactory {
	
	public static final int MYSQL = 1;
	public static final int SQL = 2;
	
	public abstract IntProductos getProductos();
	public abstract IntMesas getMesas();
	public abstract IntReservas getReservas();
	public abstract IntPedidos getPedidos();
	public abstract IntUsuarios getUsuarios();
	public abstract IntMonedas getMonedas();
	public abstract IntCategorias getCategorias();
	public abstract IntTurnos getTurnos();
	
	public static DaoFactory getDaoFactory(int qBD) {
		switch (qBD) {
		case MYSQL: 
			return new MySqlDaoFactory(); 
			
		default:
			return null;
		}
	}
}
