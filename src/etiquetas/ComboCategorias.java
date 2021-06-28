package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.DaoFactory;
import beans.Categorias;

public class ComboCategorias extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	private int value = -1;
	
	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {
			DaoFactory gestor = DaoFactory.getDaoFactory(DaoFactory.MYSQL);
			ArrayList<Categorias> lista = gestor.getCategorias().listarCategorias();
			
			out.println("<option value=\"-1\" hidden disabled selected=\"selected\">Seleccione</option>");
			
			for(Categorias c : lista) {
				if (c.getIdCategoria() == value)
					out.println("<option value= '" + c.getIdCategoria() + "' selected=\"selected\">" + c.getDescripcionCategoria() + "</option>");
				
				else
					out.println("<option value='" + c.getIdCategoria() + "'>" + c.getDescripcionCategoria() + "</option>");		
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
