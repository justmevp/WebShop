package controllers;

import model.DAOs.ProductDAO;
import model.entities.Client;
import model.entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/Trangchu/OwnerShop/searchAjax" })
public class SearchByAjaxServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			Client admin = (Client) session.getAttribute("user");
			if (admin != null) {
				int adminId = admin.getId();

				
				String searchTerm = request.getParameter("term");
				List<Product> products = ProductDAO.findProductByNameAndSellID(searchTerm,adminId);
				String json = new Gson().toJson(products);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "SearchByAjaxServlet";
	}
}
