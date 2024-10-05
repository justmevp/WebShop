package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.BOs.CartBO;
import model.entities.Client;

@WebServlet("/Trangchu/GioHang")
public class CartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String actionCart = (String) req.getParameter("actionCart");
		if (actionCart != null) {
			int cartID = Integer.parseInt(req.getParameter("cartID"));
			int quantity;
			switch (actionCart) {
			case "remove":
				CartBO.deleteItemInCart(cartID);
				break;
			case "plus":
				quantity = Integer.parseInt(req.getParameter("quantity"));
				CartBO.increaseItemInCart(cartID, quantity);
				break;
			case "minus":
				quantity = Integer.parseInt(req.getParameter("quantity"));
				CartBO.decreaseItemInCart(cartID, quantity);
				break;
			default:
				break;
			}
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Pages/ActionDataPage/Cart.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession ses = req.getSession();
		Client client = (Client) ses.getAttribute("user");
		long totalMoney = Long.parseLong(req.getParameter("totalMoney"));
		CartBO.paymentInCart(client.getId(), totalMoney);
		resp.sendRedirect(req.getContextPath() + "/Trangchu/GioHang");
	}
}
