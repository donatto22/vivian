package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Reservas;
import interfaces.IntReservas;
import utils.Conexion;

public class ReservasDao extends Conexion implements IntReservas {

	@Override
	public boolean registrar(Reservas r) {
		Connection con = getConnection();
		
		try {
			CallableStatement cs = (CallableStatement) con.prepareCall("{call AgregarReservacion(?,?,?,?)}");
			cs.setInt(1, r.getIdCliente());
			cs.setString(2, r.getNumeroMesa());
			cs.setString(3, r.getFecha());
			cs.setString(4, r.getIdTurno());
			cs.executeUpdate();
			return true;
		}
		
		catch(SQLIntegrityConstraintViolationException e) {
			System.out.println("Ya existe una mesa reservada");
			return false;
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
	public boolean eliminar(Reservas r) {
		Connection con = getConnection();
		
		try {
			CallableStatement cs = (CallableStatement) con.prepareCall("{call delReserva(?)}");
			cs.setString(1, r.getIdReserva());
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
	public ArrayList<Reservas> VerificarMesas(String nombre) {
		Connection con = getConnection();
		ArrayList<Reservas> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Reservas>();
			cs = (CallableStatement) con.prepareCall("{call verificarMesas(?)}");
			cs.setString(1, nombre);
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try(ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Reservas r = new Reservas();
						r.setIdReserva(rs.getString(1));
						r.setIdCliente(rs.getInt(2));
						r.setNumeroMesa(rs.getString(3));
						r.setPiso(rs.getInt(4));
						r.setFecha(rs.getString(5));
						r.setIdTurno(rs.getString(6));
						r.setDescripcionTurno(rs.getString(7));
						lista.add(r);
					}
				}
			}
		}
		
		
		catch(SQLException e) {
			System.out.println("Error en ReservasDao - Listar Mesas >> : " + e.getMessage());
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
	public ArrayList<Reservas> listarReservas(int codigo) {
		Connection con = getConnection();
		ArrayList<Reservas> lista = null;
		CallableStatement cs;
		
		try {
			lista = new ArrayList<Reservas>();
			cs = (CallableStatement) con.prepareCall("{call listarReservas(?)}");
			cs.setInt(1, codigo);
			
			boolean hasRs = cs.execute();
			
			if(hasRs) {
				try(ResultSet rs = cs.getResultSet()) {
					while(rs.next()) {
						Reservas r = new Reservas();
						r.setIdReserva(rs.getString(1));
						r.setIdCliente(rs.getInt(2));
						r.setNumeroMesa(rs.getString(3));
						r.setPiso(rs.getInt(4));
						r.setFecha(rs.getString(5));
						r.setIdTurno(rs.getString(6));
						lista.add(r);
					}
				}
			}
		}
		
		
		catch(SQLException e) {
			System.out.println("Error en ReservasDao - Listar Reservas por Cliente >> : " + e.getMessage());
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
	public boolean actualizar(Reservas r, String reservacion, String mesa, String fecha, String turno) {
		Connection con = getConnection();
		CallableStatement cs;
		
		try {
			//ningun dato llenado
			if(mesa == null && fecha == "" && turno == null) {
				return false;
			}
			
			//solo mesa
			if(mesa != null && fecha == "" && turno == null) {
				cs = (CallableStatement) con.prepareCall("{call modReserva_M(?,?)}");
				System.out.println("Procedimiento modReserva_M ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, mesa);
				cs.executeUpdate();
			}
			
			//solo fecha
			if(mesa == null && fecha != "" && turno == null) {
				cs = (CallableStatement) con.prepareCall("{call modReserva_F(?,?)}");
				System.out.println("Procedimiento modReserva_F ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, fecha);
				cs.executeUpdate();
			}
			
			//solo turno
			if(mesa == null && fecha == "" && turno != null) {				
				cs = (CallableStatement) con.prepareCall("{call modReserva_T(?,?)}");
				System.out.println("Procedimiento modReserva_T ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, turno);
				cs.executeUpdate();
			}
			
			//mesa y fecha
			if(mesa != null && fecha != "" && turno == null) {
				cs = (CallableStatement) con.prepareCall("{call modReserva_MF(?,?,?)}");
				System.out.println("Procedimiento modReserva_MF ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, mesa);
				cs.setString(3, fecha);
				cs.executeUpdate();
			}
			
			//fecha y turno
			if(mesa == null && fecha != "" && turno != null) {
				cs = (CallableStatement) con.prepareCall("{call modReserva_FT(?,?,?)}");
				System.out.println("Procedimiento modReserva_FT ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, fecha);
				cs.setString(3, turno);
				cs.executeUpdate();
			}
			
			//mesa y turno
			if(mesa != null && fecha == "" && turno != null) {
				cs = (CallableStatement) con.prepareCall("{call modReserva_MT(?,?,?)}");
				System.out.println("Procedimiento modReserva_MT ejecutado desde >> : " + getClass());
				cs.setString(1, reservacion);
				cs.setString(2, mesa);
				cs.setString(3, turno);
				cs.executeUpdate();
			}
			
			//todos los datos llenados
			if(mesa != null && fecha != "" && turno != null) {
				cs = (CallableStatement) con.prepareCall("{call modificarReserva(?,?,?,?)}");
				cs.setString(1, reservacion);
				cs.setString(2, mesa);
				cs.setString(3, fecha);
				cs.setString(4, turno);
				cs.executeUpdate();
			}

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
}
