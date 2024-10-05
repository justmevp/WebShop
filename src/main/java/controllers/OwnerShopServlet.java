package controllers;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BOs.CategoryBO;
import model.BOs.ProductBO;
import model.DAOs.ProductDAO;
import model.entities.Product;
import model.entities.Category;
import model.entities.Client;

@WebServlet(urlPatterns = {"/Trangchu/OwnerShop"})
public class OwnerShopServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Client client = (Client) session.getAttribute("user");
        int id = client.getId();
        List<Product> productList = ProductBO.getProductBySellID(id);
        request.setAttribute("productList", productList);
        List<Category> listC = CategoryBO.getCategorysInData();
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("/Pages/ManegerPage/table.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = ProductDAO.findByProductId(productId);
            if (product != null) {
                request.setAttribute("detail", product);
                List<Category> listC = CategoryBO.getCategorysInData();
                request.setAttribute("listCC", listC);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/ManegerPage/Edit.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("errorPage?message=Product not found");
            }
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String method = request.getParameter("type");
        if (method != null) {
            switch (method) {
                case "ADD":
                    addProduct(request);
                    response.sendRedirect(request.getContextPath() + "/Trangchu/OwnerShop?type=ADD&success=true");
                    break;
                case "DELETE":
                    deleteProduct(request);
                    response.sendRedirect(request.getContextPath() + "/Trangchu/OwnerShop?type=DELETE&success=true");
                    break;
                case "UPDATE":
                    updateProduct(request);
                    response.sendRedirect(request.getContextPath() + "/Trangchu/OwnerShop?type=UPDATE&success=true");
                    break;
            }
        }
    }


    private void addProduct(HttpServletRequest req) throws ServletException, IOException {
    	 String productName = req.getParameter("name");
         Double productPrice = Double.parseDouble(req.getParameter("price"));
//          productTitle = req.getParameter("title");
          String productDescription = req.getParameter("description");
          String productImage = req.getParameter("image");
          int categoryID = Integer.parseInt(req.getParameter("categoryID"));
          HttpSession session = req.getSession();
          Client client = (Client) session.getAttribute("user");
          int id = client.getId();
         
          // Tạo đối tượng Product với tham số categoryID
          Product productToAdd = new Product(0, productName, productImage, productPrice, productDescription, categoryID, id);
          
          // Gọi phương thức addProductToData với đối tượng mới tạo
          ProductBO.addProductToData(productToAdd);
    }

    private void deleteProduct(HttpServletRequest request) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("pID"));
        ProductBO.deleteProductInData(productID);
    }

    private void updateProduct(HttpServletRequest request) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("name");
        String productImage = request.getParameter("image");
        double productPrice = Double.parseDouble(request.getParameter("price"));
        String productDescription = request.getParameter("description");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));

        ProductDAO.updateByProductId(productID, productName, productImage, productPrice, productDescription, categoryID);
    }

    @Override
    public String getServletInfo() {
        return "OwnerShopServlet";
    }
}
