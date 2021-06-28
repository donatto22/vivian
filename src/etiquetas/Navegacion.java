package etiquetas;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Navegacion extends TagSupport {

	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {			
			out.println("<li><a href=\"/vivian/content/html/index.jsp\">Inicio</a></li>");
			out.println("<li><a href=\"/vivian/content/jsp/faq.jsp\">FAQ&#39;s</a></li>");
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