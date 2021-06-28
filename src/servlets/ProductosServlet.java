package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Productos;
import dao.DaoFactory;

@WebServlet(name = "prodcrud", urlPatterns = { "/prodcrud" })
public class ProductosServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String urlProductos = "/content/jsp/menu.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductosServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opc = request.getParameter("opcion");
		
		switch (opc) {
			case "r": registro(request, response); 
			break;
			
			case "a": actualizar(request, response); 
			break;
			
			case "e": eliminar(request, response); 
			break;
			
			case "l": listar(request, response); 
			break;
			
			default:  
				response.sendRedirect("/content/html/error.html");
		}
		
	}

	private void registro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String moneda, producto, categoria;
		String url, mensaje;
		int stock, reparto;
		double precio;
		
		moneda = request.getParameter("moneda");
		producto = request.getParameter("producto");
		precio = Double.parseDouble(request.getParameter("precio"));
		categoria = request.getParameter("categoria");
		stock = Integer.parseInt(request.getParameter("stock"));
		reparto = Integer.parseInt(request.getParameter("reparto"));
		
		Productos p = new Productos(moneda, producto, precio, categoria, stock, reparto);
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getProductos().registrar(p);
		
		if(result) {
			mensaje = "";
			System.out.println("Se grabó");
			url = urlProductos;
		}
		
		else {
			mensaje = "";
			System.out.println("no se grabó");
			url = "";
		}
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String codigo, mensaje, url;
		
		codigo = request.getParameter("codigo");
		
		Productos p = new Productos();
		p.setIdProducto(Integer.parseInt(codigo));
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		boolean result = gestor.getProductos().eliminar(p);
		
		if(result) {
			mensaje = "";
			System.out.println("Se eliminó");
			url = urlProductos;
		}
		
		else {
			mensaje = "";
			System.out.println("no se eliminó");
			url = "";
		}
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String moneda, categoria;
		
		categoria = request.getParameter("categoria");
		moneda = request.getParameter("moneda");
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		ArrayList<Productos> lista = gestor.getProductos().listar(categoria, moneda);
		
		request.setAttribute("lstProductos", lista);
		request.getRequestDispatcher(urlProductos).forward(request, response);
	}

}
