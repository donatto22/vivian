package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import beans.Mesas;
import dao.DaoFactory;

public class ComboMesas extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {
			DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
			ArrayList<Mesas> lista = gestor.getMesas().listarMesas();
			
			out.println("<option value=\"-1\" hidden disabled selected=\"selected\">Seleccione</option>");
			
			for(Mesas m : lista) {
				out.println("<option value='" + m.getnMesa() + "'>"+ m.getnMesa() +"</option>");		
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
