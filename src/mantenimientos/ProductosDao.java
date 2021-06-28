package mantenimientos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Categorias;
import beans.Productos;
import interfaces.IntProductos;
import utils.Conexion;

@SuppressWarnings("unused")
public class ProductosDao extends Conexion implements IntProductos {

	@Override
	public boolean registrar(Productos p) {
		Connection con = getConnection();
		CallableStatement cs;
		
		try {
			cs = (CallableStatement) con.prepareCall("{call AgregarProducto(?,?,?,?,?,?)}");
			cs.setString(1, p.getMoneda());
			cs.setString(2, p.getProducto());
			cs.setDouble(3, p.getPrecio());
			cs.setString(4, p.getCategoria());
			cs.setInt(5, p.getStock());
			cs.setInt(6, p.getReparto());
			cs.executeUpdate();
			return true;
		}
		
		catch(SQLException e) {
			System.out.println(e);
			return false;
		}
		
		finally {
			try {
				con.close();
			}
				
			catch(SQLException e) {
				System.out.println(e);
			}
		}
	}

	@Override
	public boolean actualizar(Productos p) {
		CallableStatement cs;
		Connection con = getConnection();
		return false;
	}

	@Override
	public boolean eliminar(Productos p) {
		CallableStatement cs;
		Connection con = getConnection();
		
		try {
			cs = (CallableStatement) con.prepareCall("{call EliminarProducto(?)}");
			cs.setInt(1, p.getIdProducto());
			cs.executeUpdate();
			return true;
		}
		
		catch(SQLException e) {
			System.out.println(e);
			return false;
		}
		
		finally {
			try {
				con.close();
			}
			
			catch(SQLException e) {
				System.out.println(e);
			}
		}
	}

	@Override
	public ArrayList<Productos> listar(String categoria, String moneda) {
		Connection con = getConnection();
		ArrayList<Productos> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Productos>();
			
			//ninguno seleccionado
			if(categoria == null && moneda == null) {
				cs = (CallableStatement) con.prepareCall("{call modView1}");
				System.out.println("Se ejecutó el 1");
			}
			
			//solo categoria
			else if(categoria != null && moneda == null) {
				cs = (CallableStatement) con.prepareCall("{call modView2(?)}");
				cs.setString(1, categoria);
				System.out.println("Se ejecutó el 2");
			}
			
			//solo moneda
			else if(categoria == null && moneda != null) {
				cs = (CallableStatement) con.prepareCall("{call modView3(?)}");
				cs.setString(1, moneda);
				System.out.println("Se ejecutó el 3");
			}
			
			//ambos seleccionados
			else {
				cs = (CallableStatement) con.prepareCall("{call modView4(?, ?)}");
				System.out.println("Se ejecutó el 4");
				cs.setString(1, categoria);
				cs.setString(2, moneda);
			}
			
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try (ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Productos p = new Productos();
						p.setIdProducto(rs.getInt(1));
						p.setMoneda(rs.getString(2));
						p.setProducto(rs.getString(3));
						p.setIdCategoria(rs.getInt(4));
						p.setCategoria(rs.getString(5));
						p.setPrecio(rs.getDouble(6));
						p.setReparto(rs.getInt(7));
						p.setStock(rs.getInt(8));
						
						lista.add(p);
					}
				}
			}
		}
		
		catch(SQLException e) {
			System.out.println("Error en ProductosDao - Listar Productos >> : " + e.getMessage());
		}
		
		finally {
			try {
				con.close();
			}
				
			catch(SQLException e) {
				System.out.println(e);
			}
		}
		
		return lista;
		
	}
	
	@Override
	public Productos getProducto(int id) {
		
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Productos p = new Productos();
		
		try {
			con = Conexion.getConnection();
			String sql = "select * from v_productos where idproducto=?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				p.setIdProducto(rs.getInt(1));
				p.setMoneda(rs.getString(2));
				p.setProducto(rs.getString(3));
				p.setIdCategoria(rs.getInt(4));
				p.setCategoria(rs.getString(5));
				p.setPrecio(rs.getDouble(6));
				p.setReparto(rs.getInt(7));
				p.setStock(rs.getInt(8));
			}
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				pstm.close();
				con.close();
				rs.close();
			} 
			
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return p;
	}
}
