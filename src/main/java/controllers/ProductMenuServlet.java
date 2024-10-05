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
import model.BOs.ProductBO;
import model.DAOs.OrderDAO;
import model.DAOs.ProductDAO;
import model.entities.Product;

@WebServlet(urlPatterns = "/Trangchu/ProductMenu")
public class ProductMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session = req.getSession();

        String categoryID = req.getParameter("categoryID");
        String search = req.getParameter("search");
        String screenSize = req.getParameter("screenSize");
        String screenType = req.getParameter("screenType");

        if (categoryID == null || categoryID.isEmpty()) {
            categoryID = (String) session.getAttribute("categoryID");
        } else {
            session.setAttribute("categoryID", categoryID);
        }

        if (search == null || search.isEmpty() || "null".equals(search)) {
            search = null;
        } else {
            session.setAttribute("search", search);
        }

        String priceString = req.getParameter("price");
        String memoryOption = req.getParameter("memory");

        if (priceString == null) {
            session.removeAttribute("price");
        } else {
            session.setAttribute("price", priceString);
        }

        if (memoryOption == null) {
            session.removeAttribute("memory");
        } else {
            session.setAttribute("memory", memoryOption);
        }

        if (screenSize == null) {
            session.removeAttribute("screenSize");
        } else {
            session.setAttribute("screenSize", screenSize);
        }

        if (screenType == null) {
            session.removeAttribute("screenType");
        } else {
            session.setAttribute("screenType", screenType);
        }

        ArrayList<Product> productList = new ArrayList<>();
        int cateID = categoryID != null ? Integer.parseInt(categoryID) : -1;
        double maxPrice = priceString != null && !priceString.isEmpty() ? Double.parseDouble(priceString) : 0;

        String sortOrder = req.getParameter("sortOrder");
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "bestseller";
        }

        if (cateID != -1) {
            productList = (ArrayList<Product>) ProductDAO.getSortedProducts(cateID, sortOrder, maxPrice, search, memoryOption, screenSize, screenType);
        } else {
            productList = ProductBO.getProductFromData();
        }

        if (cateID != -1) {
            OrderDAO orderDAO = new OrderDAO();
            List<Product> bestSellingProducts = orderDAO.getBestSellingProductsByCategory(cateID);
            req.setAttribute("bestSellingProducts", bestSellingProducts);
        }

        req.setAttribute("productList", productList);
        req.setAttribute("sortOrder", sortOrder);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/ProductMenu.jsp");
        dispatcher.forward(req, resp);
    }
}
