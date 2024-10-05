//package filter;
//
//import java.io.IOException;
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.entities.Client;
//
///**
// * Servlet Filter implementation class FilterShop
// */
//@WebFilter(urlPatterns = { "/Trangchu/OwnerShop" })
//public class FilterOwnerShop implements Filter {
//
//	/**
//	 * 
//	 */
//
//	/**
//	 * @see HttpFilter#HttpFilter()
//	 */
//	public FilterOwnerShop() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//
//	/**
//	 * @see Filter#destroy()
//	 */
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
//	 */
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//	        throws IOException, ServletException {
//	    // Lấy session và thuộc tính accesser
//	    HttpServletRequest httpRequest = (HttpServletRequest) request;
//	    HttpSession ses = httpRequest.getSession();
//	    String accesser = (String) ses.getAttribute("accesser");
//	    Client client = (Client) ses.getAttribute("shop"); // Sử dụng key "shop" để truy xuất client từ session
//
//	    // Kiểm tra xem người dùng có quyền truy cập vào trang OwnerShop không
//	    if (accesser != null && accesser.equals("shop") && client != null && client.getIsSell() == 1) {
//	        // Nếu có, cho phép yêu cầu tiếp tục được xử lý
//	        chain.doFilter(request, response);
//	    } else {
//	        // Nếu không, chuyển hướng yêu cầu đến trang khác
//	        HttpServletResponse httpResponse = (HttpServletResponse) response;
//	        httpResponse.sendRedirect(httpRequest.getContextPath() + "/CannotAccess");
//	    }
//	}
//
//	/**
//	 * @see Filter#init(FilterConfig)
//	 */
//	public void init(FilterConfig fConfig) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//}
