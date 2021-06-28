package servlets;

import static com.itextpdf.text.Element.ALIGN_CENTER;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import beans.Carrito;
import beans.Productos;
import dao.DaoFactory;

/**
 * Servlet implementation class ReporteServlet
 */
@SuppressWarnings("unused")
@WebServlet(name = "reser", urlPatterns = { "/reser" })
public class ReporteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReporteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reporte = request.getParameter("reporte");
		
		switch(reporte) {
			case "ticket": 
				ticket(request, response); break;
				
			case "boleta":
				boleta(request, response); break;
				
			default: 
				response.sendRedirect("/vivian/content/html/error.html");
		}
	}

	private void boleta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();
		
		try {
			FileOutputStream ruta = new FileOutputStream("D:/Boleta.pdf");
			Document doc = new Document();
			PdfWriter.getInstance(doc, ruta);
			
			Rectangle size = new Rectangle(200f, 100f);
			
			doc.open();
			doc.add(new Chunk(""));
			doc.setPageSize(size);
			
			Paragraph empresa = new Paragraph();
			empresa.setAlignment(Paragraph.ALIGN_CENTER);
			empresa.setFont(FontFactory.getFont("Candara", 10));
			
			empresa.add("Vivian - Restaurante Internacional S.A\n");
			doc.add(empresa);
			
			Paragraph titulo = new Paragraph();
			titulo.setAlignment(Paragraph.ALIGN_CENTER);
			titulo.setFont(FontFactory.getFont("Candara", 10));
			
			titulo.add("RUC 20004968102 Lamar 200 P-2 Lima\n");
			doc.add(titulo);
			
			Paragraph local = new Paragraph();
			local.setAlignment(Paragraph.ALIGN_CENTER);
			local.setFont(FontFactory.getFont("Candara", 10));
			
			local.add("Lima - Miraflores\n");
			doc.add(local);
			
			Paragraph boleta = new Paragraph();
			boleta.setAlignment(Paragraph.ALIGN_CENTER);
			boleta.setFont(FontFactory.getFont("Candara",10, Font.BOLD));
			
			boleta.add("BOLETA DE VENTA ELECTRÓNICA\n\n");
			doc.add(boleta);
			
			PdfPTable tabla = new PdfPTable(2);
			tabla.setWidthPercentage(50);
			//tabla.getDefaultCell().setBorder(Rectangle.NO_BORDER);
			tabla.setHorizontalAlignment(ALIGN_CENTER);
			
			//Introduciendo los valores a la tabla
			
			int caja = (int) Math.floor(Math.random() * 100);
			
			tabla.addCell("Cajero:");
			tabla.addCell("L" + String.valueOf(caja * 2));
			
			tabla.addCell("Cantidad de Productos:");
			tabla.addCell(String.valueOf(CarritoServlet.listaCarrito.size()));
			
			tabla.addCell("---- Producto ----");
			tabla.addCell("---- Precio ----");
						
			for(int i = 0; i < CarritoServlet.listaCarrito.size(); i++) {
				tabla.addCell(CarritoServlet.listaCarrito.get(i).getProducto());
				tabla.addCell(String.valueOf(CarritoServlet.listaCarrito.get(i).getPrecio()));
			}
			
			doc.add(tabla);
			
			doc.close();
			
			Desktop.getDesktop().open(new File("D:/Boleta.pdf"));
			response.sendRedirect("/vivian/car?opcion=Carrito");
		} 
		
		catch (FileNotFoundException e) {
			System.out.println("No se encuentra una ruta específica: " + e.getMessage());
		} 
		
		catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void ticket(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	private void generarLista() throws ServletException, IOException {
		boleta(null, null);
	}

}
