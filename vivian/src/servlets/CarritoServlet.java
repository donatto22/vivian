package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Carrito;
import beans.Pago;
import beans.Pedido;
import beans.Productos;
import beans.Usuario;
import dao.DaoFactory;
/**
 * Servlet implementation class CarritoServlet
 */
@WebServlet(name = "car", description = "Carrito de compras de pedidos", urlPatterns = { "/car" })
public class CarritoServlet extends HttpServlet {
	
	public static List<Carrito> listaCarrito = new ArrayList<Carrito>();
	private static final long serialVersionUID = 1L;
	private Productos prod;
	Carrito car;
	
	int item = 0, cantidad = 1;
	double totalPagar = 0.0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarritoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion=request.getParameter("opcion");
		System.out.println(opcion);
		
		if(opcion==null) opcion="listar";
		
		switch (opcion) {
			case "AgregarCarrito":
				agregarCarrito(request,response);
				break;
			
			case "Carrito":
				Carrito(request,response);
				break;
				
			case "ActualizarCantidad":
				ActualizarCantidad(request,response);
				break;
			
			case "ComprarCarrito": 
				Comprar(request,response);
				break;
				
			case "Eliminar": 
				Eliminar(request,response);
				break;
			case "GenerarPedido": 
				GenerarPedido(request,response);
				break;	
			default:
				response.sendRedirect("prodcrud?opcion=l");
				break;
		}
	}

	private void GenerarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		
		Usuario u = (Usuario) request.getSession().getAttribute("u");
		System.out.println("Pedido del cliente" + u.getIdusuario());
		LocalDate fechaactual = LocalDate.now();  
		Pago pag = new Pago(totalPagar);
		int idpago = gestor.getPedidos().RegistrarPago(pag);
		
		Pedido ped = new Pedido(u.getIdusuario(), idpago, fechaactual, totalPagar, "Cancelado", listaCarrito);
		
		int rs = gestor.getPedidos().GenerarPedido(ped);
		
		if (rs==0 && totalPagar>0) {
			//reiniciar el carrito y los contadores
			listaCarrito = new ArrayList<Carrito>();
			totalPagar = 0.0;
			request.setAttribute("carrito", listaCarrito);
			request.getRequestDispatcher("/content/jsp/carrito.jsp").forward(request, response);
		}

	}

	private void ActualizarCantidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idpro = Integer.parseInt(request.getParameter("idp"));
		int cant = Integer.parseInt(request.getParameter("Cantidad"));
		
		System.out.println(cant+""+idpro);
		
		for (int i = 0; i < listaCarrito.size(); i++) {
			
			if (listaCarrito.get(i).getIdProducto()==idpro) {
				listaCarrito.get(i).setCantidad(cant);
				double st = listaCarrito.get(i).getPrecio() * cant;
				listaCarrito.get(i).setSubTotal(st);
			}
		}
		
	}

	private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int item = Integer.parseInt(request.getParameter("it"));
		
		for (int i = 0; i < listaCarrito.size(); i++) {
			if (listaCarrito.get(i).getItem() == item) {
				listaCarrito.remove(i);
			}
		}		
	}

	private void Comprar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		totalPagar = 0.0;
		int id = Integer.parseInt(request.getParameter("id"));
		
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		prod = gestor.getProductos().getProducto(id);
		
		item = item + 1;
		
		car=new Carrito();
		car.setItem(item);
		car.setIdProducto(prod.getIdProducto());
		car.setProducto(prod.getProducto()); //nombre del producto
		car.setCantidad(cantidad); //1 por defecto
		car.setPrecio(prod.getPrecio());
		car.setCategoria(prod.getCategoria());
		car.setSubTotal((prod.getPrecio() * cantidad));
		listaCarrito.add(car);
		
		request.setAttribute("carrito",listaCarrito);
		
		for (int i = 0; i < listaCarrito.size(); i++) {
			totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
		}
		
		request.setAttribute("totalPagar", totalPagar);
		request.setAttribute("carrito",listaCarrito);
		request.setAttribute("contador"," >> "+listaCarrito.size());
		
		request.getRequestDispatcher("/content/jsp/carrito.jsp").forward(request, response);
	}

	private void Carrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		totalPagar = 0.0;
		request.setAttribute("carrito",listaCarrito);
		
		for (int i = 0; i < listaCarrito.size(); i++) {
			totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
		}
		
		request.setAttribute("totalPagar", totalPagar);
		request.getRequestDispatcher("/content/jsp/carrito.jsp").forward(request, response);
	}

	private void agregarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pos = 0;
		cantidad = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
		prod = gestor.getProductos().getProducto(id);
		
		if(listaCarrito.size() > 0) {
			for (int i = 0; i < listaCarrito.size(); i++) {
				if (id == listaCarrito.get(i).getIdProducto()) {
					pos = i;
					break;
				}
			}
			
			if (id == listaCarrito.get(pos).getIdProducto()) {
				cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
				double subtotal = listaCarrito.get(pos).getPrecio() * cantidad;
				listaCarrito.get(pos).setCantidad(cantidad);
				listaCarrito.get(pos).setSubTotal(subtotal);
			}
			
			else {
				item = item + 1;
				car = new Carrito();
				car.setItem(item);
				car.setIdProducto(prod.getIdProducto());
				car.setProducto(prod.getProducto());
				car.setCantidad(cantidad);
				car.setPrecio(prod.getPrecio());
				car.setCategoria(prod.getCategoria());
				car.setSubTotal((prod.getPrecio() * cantidad));
				listaCarrito.add(car);
				System.out.println("Agregado a carrito");
			}
		}
		
		else {			
			item = item + 1;
			car=new Carrito();
			car.setItem(item);
			car.setIdProducto(prod.getIdProducto());
			car.setProducto(prod.getProducto());
			car.setCantidad(cantidad);
			car.setPrecio(prod.getPrecio());
			car.setCategoria(prod.getCategoria());
			car.setSubTotal((prod.getPrecio() * cantidad));
			listaCarrito.add(car);
		}
		
		
		request.setAttribute("contador",listaCarrito.size());
		request.getRequestDispatcher("prodcrud?opcion=l").forward(request, response);
	}	

}
