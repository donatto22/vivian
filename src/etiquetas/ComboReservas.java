package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import beans.Reservas;
import dao.DaoFactory;

public class ComboReservas extends TagSupport {
	
	private int value = 0;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {
			DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
			ArrayList<Reservas> lista = gestor.getReservas().listarReservas(value);
			
			out.println("<option value=\"-1\" hidden disabled selected=\"selected\">Seleccione</option>");
			
			for(Reservas r : lista) {
				out.println("<option value='" + r.getIdReserva() + "'>" + r.getIdReserva() + "</option>");		
			}
		} 
		
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
	
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
}
