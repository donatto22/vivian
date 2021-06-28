package interfaces;

import beans.Usuario;

public interface IntUsuarios {

	public boolean registrar(Usuario u);
	
	public boolean modificar(Usuario u);
	
	public boolean eliminar(Usuario u);
	
	public Usuario login(String email, String clave);
}
