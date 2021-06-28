package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Usuario;
import dao.DaoFactory;

// Servlet implementation class UserLogServlet 
@WebServlet(name = "userlog", urlPatterns = { "/userlog" })
public class UsuariosServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String urlIndex = "/content/html/index.jsp";
	private static final String urlLogin = "/content/jsp/login.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuariosServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opc = request.getParameter("opc");
		
		switch (opc) {
			case "r": registro(request, response); 
			break;
			
			case "m": modificar(request, response); 
			break;
			
			case "e": eliminar(request, response); 
			break;
			
			case "l": login(request, response); 
			break;
			
			case "c": cerrar(request, response);
			break;
			
			default:  
				response.sendRedirect("/content/html/error.html");
		}
	}


	private void cerrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("/vivian/content/html/index.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession miSession = request.getSession();

		String email, clave, url, mensaje;
        email = request.getParameter("txtCorreo");
        clave = request.getParameter("txtClave");
        
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		Usuario u = gestor.getUsuarios().login(email, clave);
        
        System.out.println("Id de sesion: " + miSession.getId() + " Tiempo: " + miSession.getMaxInactiveInterval());
        
		if(u != null) {
			url = urlIndex;
			mensaje = "<script>logeoBueno();</script>";
			request.getSession().setAttribute("u", u);
			request.getSession().setMaxInactiveInterval(600);
		} 
		
		else {
			url = urlLogin;
			mensaje = "<script>logeoMalo();</script>";
		}
		
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher(url).forward(request, response);        
	}

	private void registro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre, apellido, correo, clave, telefono, dni, tipo;
		String url, mensaje;
		
		dni = request.getParameter("dni");
		nombre = request.getParameter("nombre");
		apellido = request.getParameter("apellido");
		correo = request.getParameter("correo");
		clave = request.getParameter("clave");
		telefono = request.getParameter("telefono");
		tipo = request.getParameter("tipo");
		
		Usuario u = new Usuario();
		u.setDni(Integer.parseInt(dni));
		u.setNombre(nombre);
		u.setApellido(apellido);
		u.setCorreo(correo);
		u.setClave(clave);
		u.setTelefono(Integer.parseInt(telefono));
		u.setIdtipo(Integer.parseInt(tipo));
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getUsuarios().registrar(u);
		
		if (result) {
			mensaje = null;
			Usuario u2 = gestor.getUsuarios().login(correo, clave);
			
			if(u != null) {
				url = urlIndex;
				mensaje = "<script>logeoBueno();</script>";
				request.getSession().setAttribute("u", u2);
				request.getSession().setMaxInactiveInterval(600);
			}
			
			url = urlIndex;
		}
		
		else {
			mensaje = null;
			url = urlLogin;
		}
		
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher(url).forward(request, response);
		
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre, apellido, correo, clave;
		String url, mensaje;
		
		int telefono, dni, codigo;
		
		dni = Integer.parseInt(request.getParameter("dni"));
		nombre = request.getParameter("nombre");
		apellido = request.getParameter("apellido");
		correo = request.getParameter("correo");
		clave = request.getParameter("clave");
		telefono = Integer.parseInt(request.getParameter("telefono"));
		codigo = Integer.parseInt(request.getParameter("codigo"));
		
		Usuario u = new Usuario(codigo, dni, nombre, apellido, correo, clave, telefono);	
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getUsuarios().modificar(u);
		
		if(result) {
			mensaje = null;
			System.out.println("Se actualizó");
			Usuario u2 = gestor.getUsuarios().login(correo, clave);
			
			if(u != null) {
				url = urlIndex;
				mensaje = "<script>modificadoBueno();</script>";
				request.getSession().setAttribute("u", u2);
				request.getSession().setMaxInactiveInterval(600);
			}
			
			url = urlIndex;
		}
		
		else {
			mensaje = "<script>modificadoMalo();</script>";
			System.out.println("no se actualizó");
			url = urlIndex;
		}
		
		request.setAttribute("mensaje", mensaje);
	    request.getRequestDispatcher(url).forward(request, response);
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo, mensaje, url;
		
		codigo = request.getParameter("codigo");
		
		Usuario u = new Usuario();
		u.setIdusuario(Integer.parseInt(codigo));
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getUsuarios().eliminar(u);
		
		if (result) {
			mensaje = "<script>eliminadoBueno();</script>";
			url = urlIndex;
		}
		
		else {
			mensaje = "<script>eliminadoMalo();</script>";
			url = urlLogin;
		}
		
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher(url).forward(request, response);
	}
}
