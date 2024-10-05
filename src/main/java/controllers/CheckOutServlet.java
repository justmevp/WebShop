//package controllers;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import model.DAOs.OrderDAO;
//import model.entities.Cart;
//import model.entities.Client;
//import model.entities.Order;
//import config.ConnectionSQL;
//
//
//@WebServlet(urlPatterns= "/Trangchu/cart-check-out")
//public class CheckOutServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//   
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try(PrintWriter out = response.getWriter()){
//			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = new Date();
//			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
//			Client auth = (Client) request.getSession().getAttribute("user");
//			if(cart_list != null && auth!=null) {
//				for(Cart c:cart_list) {
//					Order order = new Order();
//					order.setId(c.getId());
//					order.setUid(auth.getId());
//					order.setQunatity(c.getQuantity());
//					order.setDate(formatter.format(date));
//					order.setAddress(request.getParameter("address")); // Thêm thông tin địa chỉ từ request
//					order.setPhone(request.getParameter("phoneNumber")); // Thêm thông tin số điện thoại từ request
//					OrderDAO oDao = new OrderDAO(ConnectionSQL.getConnection());
//					boolean result = oDao.insertOrder(order);
//					if(!result) break;
//				}
//				cart_list.clear();
//				 response.sendRedirect(request.getContextPath() + "/Trangchu/Payment");
//			}else {
//				if(auth==null) {
//					response.sendRedirect("SignUpIn.jsp");
//				}
//				response.sendRedirect("cart.jsp");
//			}
//		}
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}