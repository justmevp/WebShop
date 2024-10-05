package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.entities.Client;

/**
 * Servlet Filter implementation class FilterAccountUser
 */
@WebFilter(urlPatterns = { "/Trangchu/Account", "/Trangchu/GioHang" })
public class FilterAccountUser implements Filter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public FilterAccountUser() {
		super();
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession ses = httpRequest.getSession();
		String accesser = (String) ses.getAttribute("accesser");
		Client client = (Client) ses.getAttribute("user");
		if (accesser != null && accesser.equals("user") && client != null)
			chain.doFilter(request, response);
		else
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/Trangchu/SignUpIn");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
