package mantenimientos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

import beans.Usuario;
import interfaces.IntUsuarios;
import utils.Conexion;

public class UsuariosDao extends Conexion implements IntUsuarios {

	@Override
	public boolean registrar(Usuario u) {
		Connection con = getConnection();
		CallableStatement cs;
		
		try {
			cs = (CallableStatement) con.prepareCall("{call AgregarUsuario(?,?,?,?,?,?,?)}");
			cs.setInt(1, u.getDni());
			cs.setString(2, u.getNombre());
			cs.setString(3, u.getApellido());
			cs.setString(4, u.getCorreo());
			cs.setString(5, u.getClave());
			cs.setInt(6, u.getTelefono());
			cs.setInt(7, u.getIdtipo());
			cs.execute();
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
	public boolean modificar(Usuario u) {
		Connection con = getConnection();
		CallableStatement cs;
		
		try {
			cs = (CallableStatement) con.prepareCall("{call ModificarUsuario(?,?,?,?,?,?,?)}");
			cs.setInt(1, u.getIdusuario());
			cs.setInt(2, u.getDni());
			cs.setString(3, u.getNombre());
			cs.setString(4, u.getApellido());
			cs.setString(5, u.getCorreo());
			cs.setString(6, u.getClave());
			cs.setInt(7, u.getTelefono());			
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
	public boolean eliminar(Usuario u) {
		Connection con = getConnection();
		CallableStatement cs;
		
		try {
			cs = (CallableStatement) con.prepareCall("{call eliminarUsuario(?)}");
			cs.setInt(1, u.getIdusuario());
			cs.execute();
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
	public Usuario login(String email, String clave) {
		Connection con = getConnection();
		CallableStatement cs;
		Usuario u = null;
		
		try {
			cs = (CallableStatement) con.prepareCall("{call vUsuario(?, ?)}");
			cs.setString(1, email);
			cs.setString(2, clave);
			cs.executeQuery();
			
			try (ResultSet rs = cs.getResultSet()) {				
		        
		        while (rs.next()) {
		        	u = new Usuario();
		            u.setIdusuario(rs.getInt(1));
		            u.setDni(rs.getInt(2));
		            u.setNombre(rs.getString(3));
		            u.setApellido(rs.getString(4));
		            u.setCorreo(rs.getString(5));
		            u.setClave(rs.getString(6));
		            u.setTelefono(rs.getInt(7));
		            u.setFechareg(rs.getString(8));
		            u.setIdtipo(rs.getInt(9));
		        }
			}
			
			catch(Exception e) {
				System.out.println("Error en UsuariosDao >> : " + e.getMessage());
			}
		}
		
		catch(SQLException e) {
			System.out.println(e);
			return null;
		}
		
		finally {
			try {
				con.close();
			}
				
			catch(SQLException e) {
				System.out.println(e);
			}
		}
		
		return u;
	}
}
