package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Mesas;
import interfaces.IntMesas;
import utils.Conexion;

public class MesasDao extends Conexion implements IntMesas {

	@Override
	public ArrayList<Mesas> listarMesas() {
		Connection con = getConnection();
		ArrayList<Mesas> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Mesas>();
			cs = (CallableStatement) con.prepareCall("{call modBox(4)}");
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try (ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Mesas m = new Mesas();
						m.setnMesa(rs.getInt(1));
						m.setPiso(rs.getInt(2));
						m.setCapacidad(rs.getInt(3));
						
						lista.add(m);
					}
				}
			}
		}
		
		catch(SQLException e) {
			System.out.println("Error en MesasDao - Listar Mesas >> :" + e.getMessage());
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
