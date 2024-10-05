package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.DAOs.ReviewDAO;
import model.entities.Client;

@WebServlet(urlPatterns= "/Trangchu/submitReview")
public class SubmitReviewServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession session = request.getSession();
		    Client currentUser = (Client) session.getAttribute("user");

		    String comment = request.getParameter("comment");
		    String productIdStr = request.getParameter("productId");

		    if (productIdStr == null || productIdStr.isEmpty()) {
		        response.sendRedirect("Detail.jsp?error=InvalidProductId");
		        return;
		    }

		    int productId = 0;
		    try {
		        productId = Integer.parseInt(productIdStr);
		    } catch (NumberFormatException e) {
		        response.sendRedirect("Detail.jsp?error=InvalidProductId");
		        return;
		    }

		    if (currentUser != null) {
		        ReviewDAO.insert(comment, currentUser.getId(), productId);
		        response.sendRedirect("Product?id=" + productId);
		    } 
		}
}