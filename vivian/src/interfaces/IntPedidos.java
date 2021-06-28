package interfaces;

import beans.Pago;
import beans.Pedido;

public interface IntPedidos {
	
	public int GenerarPedido(Pedido pedido);
	
	public int RegistrarPago(Pago pago);
}
