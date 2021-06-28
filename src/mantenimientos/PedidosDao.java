package mantenimientos;

import java.sql.*;
import java.util.Iterator;

import beans.Carrito;
import beans.Pago;
import beans.Pedido;
import interfaces.IntPedidos;
import utils.Conexion;

@SuppressWarnings("unused")
public class PedidosDao implements IntPedidos{

	@Override
	public int GenerarPedido(Pedido pedido) {
		int idPedido;
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int r=0;
		try {
			con = Conexion.getConnection();
			con.setAutoCommit(false);
			String sql = "INSERT INTO pedido(idUsuario,idPago,fechaCompra,monto,estado) values(?,?,?,?,?)";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,pedido.getIdcliente());
			pstm.setInt(2, pedido.getIdpago());
			pstm.setDate(3, java.sql.Date.valueOf(pedido.getFecha()));
			pstm.setDouble(4, pedido.getMonto());
			pstm.setString(5, pedido.getEstado());
			pstm.executeUpdate();
			
			sql = "Select @@IDENTITY AS idPedido";
			rs = pstm.executeQuery(sql);
			rs.next();
			idPedido=rs.getInt("idPedido");
			System.out.println("id pedido:"+idPedido);
			for (Carrito detalle : pedido.getDetallecompras()) {
				sql="insert into detalles_pedido(idProducto,idPedido,cantidad,precio,precioTotal) values(?,?,?,?,?)";
				try {
					pstm=con.prepareStatement(sql);
					pstm.setInt(1,detalle.getIdProducto());
					pstm.setInt(2,idPedido);
					pstm.setInt(3, detalle.getCantidad());
					pstm.setDouble(4, detalle.getPrecio());
					pstm.setDouble(5, detalle.getSubTotal());
					pstm.executeUpdate();
				} catch (Exception e) {
					System.out.println("Error al generar detalle "+e.getMessage());
				}
			}
			con.commit();
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			System.err.println("Error al generar pedido"+e.getMessage());
		}
		try {
			pstm.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Error al cerrar la bd"+e.getMessage());
		}
		return r;
	}

	@Override
	public int RegistrarPago(Pago pago) {
		int idPago = 0;
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int r = 0;
		
		try {
			con = Conexion.getConnection();
			String sql="insert into pago(monto) values(?)";
			pstm = con.prepareStatement(sql);
			pstm.setDouble(1, pago.getMonto());
			r=pstm.executeUpdate();
			
			sql = "Select @@IDENTITY AS idPago";
			rs = pstm.executeQuery(sql);
			rs.next();
			idPago=rs.getInt("idPago");
			
			
		} 
		
		catch (Exception e) {
			System.err.println("No se registro el pago " + e.getMessage() );
		}
		
		try {
			pstm.close();
			con.close();
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Error al cerrar la bd " + e.getMessage());
		}
		
		return idPago;
	}
}
