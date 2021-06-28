package dao;

import interfaces.*;
import mantenimientos.*;

public class MySqlDaoFactory extends DaoFactory {

	@Override
	public IntProductos getProductos() {
		return new ProductosDao();
	}

	@Override
	public IntMesas getMesas() {
		return new MesasDao();
	}

	@Override
	public IntReservas getReservas() {
		return new ReservasDao();
	}


	@Override
	public IntUsuarios getUsuarios() {
		return new UsuariosDao();
	}

	@Override
	public IntMonedas getMonedas() {
		return new MonedasDao();
	}

	@Override
	public IntCategorias getCategorias() {
		return new CategoriasDao();
	}

	@Override
	public IntPedidos getPedidos() {
		return new PedidosDao();
	}

	@Override
	public IntTurnos getTurnos() {
		return new TurnosDao();
	}

}
