package beans;

import java.io.Serializable;

public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String nombre, apellido, correo, clave, fechareg;
	private int dni, telefono;
    private int idusuario, idtipo, estado;
    
    public Usuario() {}
    
    public Usuario(int idusuario, int dni, String nombre, String apellido, String correo, String clave, int telefono) {
    	this.idusuario = idusuario;
    	this.dni = dni;
    	this.nombre = nombre;
    	this.apellido = apellido;
    	this.correo = correo;
    	this.clave = clave;
    	this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getApellido() {
        return apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public String getClave() {
        return clave;
    }
    
    public void setClave(String clave) {
        this.clave = clave;
    }
    
    public int getDni() {
        return dni;
    }
    
    public void setDni(int dni) {
        this.dni = dni;
    }
    
    public int getTelefono() {
        return telefono;
    }
    
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
    public int getIdtipo() {
        return idtipo;
    }
    
    public void setIdtipo(int idtipo) {
        this.idtipo = idtipo;
    }
    
    public int getEstado() {
        return estado;
    }
    
    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    public String getFechareg() {
        return fechareg;
    }
    
    public void setFechareg(String fechareg) {
        this.fechareg = fechareg;
    }
    
    public int getIdusuario() {
        return idusuario;
    }
    
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
}
