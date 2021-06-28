package servlets;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import beans.Carrito;


@WebListener
public class Listener implements HttpSessionListener {

    public Listener() {
    	
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
        System.out.println("ID Sesión   : " + arg0.getSession().getId());
        System.out.println("Creado      : " + new SimpleDateFormat().format(arg0.getSession().getCreationTime()));
        System.out.println("Inactividad : " + arg0.getSession().getMaxInactiveInterval());
        
        double totalPagar = 0.0;
    	List<Carrito> listaCarrito = new ArrayList<Carrito>();
    	arg0.getSession().setAttribute("totalPagar", totalPagar);
    	arg0.getSession().setAttribute("carrito", listaCarrito);
        
        
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	System.out.println("ID Sesión   : " + arg0.getSession().getId());
        System.out.println("Ultimo acceso : " + new SimpleDateFormat().format(arg0.getSession().getLastAccessedTime()));
    }
	
}
