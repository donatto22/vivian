package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Reservas;
import dao.DaoFactory;

@WebServlet(name = "reServlet", urlPatterns = { "/reServlet" })
public class ReservacionesServlet extends HttpServlet {
	
	private static String urlReservacionesMesas = "/content/jsp/reservas.jsp";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservacionesServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opc = request.getParameter("opcion");
		
		switch (opc) {
			case "r" :
				registrar(request, response);
				break;
				
			case "a" : 
				actualizar(request, response);
				break;
				
			case "e" :
				eliminar(request, response);
				break;
				
			case "mm": 
				mostrarMesas(request, response);
				break;
				
			default:
				response.sendRedirect("/vivian/content/html/error.html");
		}	
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fecha, turno, nMesa;
		String nombreCompleto;

		int cliente;
		
		nMesa = request.getParameter("mesa");
		cliente = Integer.parseInt(request.getParameter("codigo"));
		fecha = request.getParameter("fecha");
		turno = request.getParameter("turno");
		nombreCompleto = request.getParameter("name");
		
		Reservas r = new Reservas(nMesa, cliente, fecha, turno);
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		gestor.getReservas().registrar(r);
		
		
		DaoFactory gestor2 = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		ArrayList<Reservas> lista = gestor2.getReservas().VerificarMesas(nombreCompleto);
		
		request.setAttribute("lstMesas", lista);
		request.getRequestDispatcher(urlReservacionesMesas).forward(request, response);
		
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fecha, turno, reservacion, nMesa;
		String mensaje;
		
		nMesa = request.getParameter("mesa");
		fecha = request.getParameter("fecha");
		turno = request.getParameter("turno");
		reservacion = request.getParameter("reservacion");
		
		Reservas r = new Reservas();
		r.setIdReserva(reservacion);
		r.setNumeroMesa(nMesa);
		r.setFecha(fecha);
		r.setIdTurno(turno);

		//obteniendo los datos del formulario para verificar la inserción
		System.out.println("----------------------------");
		System.out.println("Reservacion :" + reservacion);
		System.out.println("Mesa : " + nMesa);
		System.out.println("Fecha: " + fecha);
		System.out.println("Turno :" + turno);
		System.out.println("----------------------------");
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getReservas().actualizar(r, reservacion, nMesa, fecha, turno);
		
		if(result) {
			mensaje = "";
		}
		
		else {
			mensaje = "";			
		}
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(urlReservacionesMesas).forward(request, response);
	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("cod");
		String mensaje;
		
		Reservas r = new Reservas();
		r.setIdReserva(codigo);
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getReservas().eliminar(r);
		
		if(result) {
			mensaje = "";
		}
		
		else {
			mensaje = "";		
		}
		
		request.setAttribute("mensaje", mensaje);
		mostrarMesas(request, response);
	}
	
	private void mostrarMesas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreCompleto;
		
		nombreCompleto = request.getParameter("name");
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		ArrayList<Reservas> lista = gestor.getReservas().VerificarMesas(nombreCompleto);
		
		request.setAttribute("lstMesas", lista);
		request.getRequestDispatcher(urlReservacionesMesas).forward(request, response);
	}
}
