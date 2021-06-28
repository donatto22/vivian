package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	public static Connection getConnection() {
		
		final String user = "root";
		final String pass = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/vivian", user, pass);
			return conexion;
		}
		
		catch (SQLException e) {
			System.out.println("Error de conexión con la BD : >>" + e.getMessage());
			return null;
		} 
		
		catch (Exception e) {
			System.out.println("Error >> General : " + e.getMessage());
			return null;
		}
	}
	
	public static void closeConexion(Connection conexion) {
		
		try {
			conexion.close();
		} 
		
		catch (SQLException e) {
			System.out.println("Problemas al cerrar la conexion : " + e.getMessage());
		}
	}
}
