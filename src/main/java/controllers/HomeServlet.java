package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BOs.CartBO;
import model.BOs.CategoryBO;
import model.BOs.ClientBO;
import model.BOs.CommentBO;
import model.BOs.ProductBO;
import model.DAOs.ProductDAO;
import model.entities.Cart;
import model.entities.Category;
import model.entities.Client;
import model.entities.Review;
import model.entities.Product;

@WebServlet("/Trangchu")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Lấy danh sách các danh mục sản phẩm từ cơ sở dữ liệu
	    ArrayList<Category> categories = CategoryBO.getCategorysInData();
	    ArrayList<Product> saleProducts = ProductDAO.getDiscountedPhones(1); //iphone
	    ArrayList<Product> saleProducts2 = ProductDAO.getDiscountedPhones(2); //samsung
	    ArrayList<Product> saleProducts3 = ProductDAO.getDiscountedPhones(3); //xiaomi
	    ArrayList<Product> saleProducts4 = ProductDAO.getDiscountedPhones(4);
	    // Đặt danh sách các danh mục như là một thuộc tính trong request để hiển thị trong thanh category1 bar
	    request.setAttribute("categories", categories);
	    
	    // Kiểm tra xem người dùng đã chọn một danh mục cụ thể chưa
	    String categoryIdStr = request.getParameter("categoryId");
	    if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
	        // Nếu người dùng đã chọn một danh mục cụ thể, lấy danh sách sản phẩm mới nhất theo categoryId
	        int categoryId = Integer.parseInt(categoryIdStr);
	        ArrayList<Product> newestProducts = ProductBO.getNewestProductsByCategory(categoryId);
	        

	        // Đặt danh sách sản phẩm mới nhất như là một thuộc tính trong request để hiển thị trong Home.jsp
	        request.setAttribute("newestProducts", newestProducts);
	        
	    }
	    request.setAttribute("saleProducts", saleProducts);
	    request.setAttribute("saleProducts2", saleProducts2);
	    request.setAttribute("saleProducts3", saleProducts3);
	    request.setAttribute("saleProducts4", saleProducts4);
	    // Forward the request to the Home.jsp page
	    RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
	    dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession ses = req.getSession();
		Client client = (Client) ses.getAttribute("user");
		String comment = req.getParameter("comment");
		int id = Integer.parseInt(req.getParameter("id"));

		CommentBO.addCommentToData(new Review(comment, client.getId(), id));
		resp.sendRedirect(req.getContextPath() + "/Trangchu/Product?id=" + id);
	}
	
}
