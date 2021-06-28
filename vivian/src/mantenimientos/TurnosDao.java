package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Turno;
import interfaces.IntTurnos;
import utils.Conexion;

public class TurnosDao extends Conexion implements IntTurnos{

	@Override
	public ArrayList<Turno> listarTurnos() {
		Connection con = getConnection();
		ArrayList<Turno> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Turno>();
			cs = (CallableStatement) con.prepareCall("{call modBox(3)}");
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try (ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Turno t = new Turno();
						t.setIdTurno(rs.getString(1));
						t.setDescripcion(rs.getString(2));
						
						lista.add(t);
					}
				}
			}
		}
		
		catch(SQLException e) {
			System.out.println("Error en TurnosDao - Listar Turnos >> :" + e.getMessage());
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
