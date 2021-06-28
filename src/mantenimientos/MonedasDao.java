package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Monedas;
import interfaces.IntMonedas;
import utils.Conexion;

public class MonedasDao extends Conexion implements IntMonedas {

	@Override
	public ArrayList<Monedas> listaMonedas() {
		Connection con = getConnection();
		ArrayList<Monedas> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Monedas>();
			cs = (CallableStatement) con.prepareCall("{call modBox(2)}");
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try (ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Monedas m = new Monedas();
						m.setMoneda(rs.getString(1));
						m.setDescripcion(rs.getString(2));
						
						lista.add(m);
					}
				}
			}
		}
		
		catch(SQLException e) {
			System.out.println("Error en MonedasDao - Listar Monedas >> :" + e.getMessage());
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