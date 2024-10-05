package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.BOs.PaymentBO;
import model.DAOs.OrderDAO;
import model.entities.Cart;
import model.entities.Client;
import model.entities.Order;
import model.entities.Payment;
import config.ConnectionSQL;

@WebServlet("/Trangchu/Payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        RequestDispatcher dispatcher = req.getRequestDispatcher("/Pages/ActionDataPage/Payment.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession ses = req.getSession();
        Client client = (Client) ses.getAttribute("user");

        // Nếu client chưa đăng nhập, chuyển hướng tới trang đăng nhập
        if (client == null) {
            resp.sendRedirect("SignUpIn.jsp");
            return;
        }

        // Nếu request từ trang Cart.jsp, chuyển hướng tới trang Payment.jsp
        if (req.getParameter("fullName") != null) {
            ses.setAttribute("fullName", req.getParameter("fullName"));
            ses.setAttribute("address", req.getParameter("address"));
            ses.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
            ses.setAttribute("birthdate", req.getParameter("birthdate"));
            ses.setAttribute("total", req.getParameter("total"));
            RequestDispatcher dispatcher = req.getRequestDispatcher("/Pages/ActionDataPage/Payment.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        

        // Lưu thông tin thanh toán và order vào cơ sở dữ liệu
        String money = req.getParameter("money");
        String cardholderName = req.getParameter("name");

        // Lưu thông tin thanh toán
        PaymentBO.addPaymentToData(new Payment(0, cardholderName, client.getFullName(), 0, client.getId(), money));

        // Lưu thông tin order vào cơ sở dữ liệu
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) ses.getAttribute("cart-list");
        if(cart_list != null) {
            for(Cart c : cart_list) {
                Order order = new Order();
                order.setId(c.getId());
                order.setUid(client.getId());
                order.setQunatity(c.getQuantity());
                order.setDate(formatter.format(date));
                order.setAddress((String) ses.getAttribute("address")); // Lấy thông tin địa chỉ từ session
                order.setPhone((String) ses.getAttribute("phoneNumber")); // Lấy thông tin số điện thoại từ session
                OrderDAO oDao = new OrderDAO(ConnectionSQL.getConnection());
                boolean result = oDao.insertOrder(order);
                if(!result) break;
            }
            cart_list.clear();
        }

        resp.sendRedirect(req.getContextPath() + "/Trangchu");
    }
}