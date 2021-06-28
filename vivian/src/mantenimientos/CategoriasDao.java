package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Categorias;
import interfaces.IntCategorias;
import utils.Conexion;

public class CategoriasDao extends Conexion implements IntCategorias {

	@Override
	public ArrayList<Categorias> listarCategorias() {
		Connection con = getConnection();
		ArrayList<Categorias> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Categorias>();
			cs = (CallableStatement) con.prepareCall("{call modBox(1)}");
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try (ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Categorias c = new Categorias();
						c.setIdCategoria(rs.getInt(1));
						c.setDescripcionCategoria(rs.getString(2));
						
						lista.add(c);
					}
				}
			}
		}
		
		catch(SQLException e) {
			System.out.println("Error en ProductosDao - Listar Categorias >> :" + e.getMessage());
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

}
