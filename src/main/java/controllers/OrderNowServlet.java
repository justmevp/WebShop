package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;

import config.ConnectionSQL;

import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOs.OrderDAO;
import model.entities.Client;
import model.entities.Order;
import model.entities.Cart;

@WebServlet(urlPatterns= "/Trangchu/order-now")
public class OrderNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thiết lập loại nội dung và bộ mã hóa cho phản hồi
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Định dạng ngày theo yyyy-MM-dd
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            // Lấy ngày hiện tại
            Date date = new Date();

            // Lấy thông tin của người dùng đã đăng nhập từ session
            Client auth = (Client) request.getSession().getAttribute("user");
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (auth != null) {
                // Lấy id và số lượng sản phẩm từ request
                String productId = request.getParameter("id");
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                // Đảm bảo số lượng sản phẩm không âm
                if (productQuantity <= 0) {
                    productQuantity = 1;
                }
                // Tạo một đối tượng Order mới
                Order orderModel = new Order();
                // Thiết lập thông tin cho đối tượng Order
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQunatity(productQuantity);
                orderModel.setDate(formatter.format(date));
            
                // Tạo một đối tượng OrderDAO và thực hiện việc chèn đơn hàng vào cơ sở dữ liệu
                OrderDAO orderDao = new OrderDAO(ConnectionSQL.getConnection());
                boolean result = orderDao.insertOrder(orderModel);
                // Nếu chèn thành công
                if (result) {
                    // Lấy danh sách giỏ hàng từ session
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    // Nếu giỏ hàng không rỗng
                    if (cart_list != null) {
                        // Duyệt qua các mục trong giỏ hàng
                        for (Cart c : cart_list) {
                            // Nếu id của mục giỏ hàng trùng với id sản phẩm đã đặt hàng
                            if (c.getId() == Integer.parseInt(productId)) {
                                // Loại bỏ mục đó khỏi giỏ hàng
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    // Chuyển hướng đến trang Orders.jsp
                    response.sendRedirect("Orders.jsp");
                } else {
                    // In ra thông báo đặt hàng thất bại
                    out.println("order failed");
                }
            } else {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                response.sendRedirect("SignUpIn.jsp");
            }
        } 
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi phương thức doGet khi có yêu cầu POST
        doGet(request, response);
    }
}
