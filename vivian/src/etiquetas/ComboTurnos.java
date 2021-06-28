package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import beans.Turno;
import dao.DaoFactory;

public class ComboTurnos extends TagSupport {
	
	private static final long serialVersionUID = 1L;
	
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {
			DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
			ArrayList<Turno> lista = gestor.getTurnos().listarTurnos();
			
			out.println("<option value=\"-1\" hidden disabled selected=\"selected\">Seleccione</option>");
			
			for(Turno t : lista) {
				out.println("<option value='" + t.getIdTurno() + "'>" + t.getDescripcion() + "</option>");
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
