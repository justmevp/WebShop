package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProcessPayment", urlPatterns = "/Trangchu/ProcessPayment")
public class ProcessPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String birthdate = request.getParameter("birthdate");
        String total = request.getParameter("total");

        // Đặt thuộc tính cho request:
        request.setAttribute("fullName", fullName);
        request.setAttribute("address", address);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("birthdate", birthdate);
        request.setAttribute("total", total);

        // Chuyển tiếp đến trang Payment.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/ActionDataPage/Payment.jsp");
        dispatcher.forward(request, response);
    }
}
