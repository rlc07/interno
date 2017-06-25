package interno.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class filter
 */
@WebFilter("/*")
public class filter implements Filter {

	private static final String[] URLS_TO_EXCLUDE = {".woff2",".woff",".css", ".js", ".png", ".jpg", ".gif","login.jsp"};
    /**
     * Default constructor. 
     */
    public filter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = ((HttpServletRequest) request);
		String uri = httpRequest.getRequestURI();
		
		if (!isURIToExclusao(uri, httpRequest)) {
			HttpSession session = httpRequest.getSession();
			if (session.getAttribute("usuarioLogado") == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			} else {
				chain.doFilter(request, response);
			}
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	private boolean isURIToExclusao(String uri, HttpServletRequest httpRequest) {
		boolean retorno = false;
		for (String url : URLS_TO_EXCLUDE) {
			
			
			if (uri != null && uri.endsWith(url)) {
				retorno = true;
			}
			
			if (uri != null && uri.endsWith("login")) {
				retorno = true;
			}
		}
		return retorno;
	}
}
