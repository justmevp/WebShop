package controllers;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.BOs.ClientBO;
import model.entities.Client;

@WebServlet("/Trangchu/SignUpIn/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward request và response tới trang ForgotPassword.jsp
        req.getRequestDispatcher("/Pages/SignUp-In/ForgotPassword.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
       
        // Lấy thông tin tài khoản và mật khẩu gần nhất từ request
        String username = req.getParameter("user");
        String lastPassword = req.getParameter("password");

        // Kiểm tra mật khẩu gần nhất và cập nhật mật khẩu mới nếu hợp lệ
        if (isValidPassword(username, lastPassword)) {
            // Chuyển hướng đến trang cập nhật mật khẩu mới và truyền tên người dùng
        	resp.sendRedirect(req.getContextPath() + "/Trangchu/SignUpIn/ForgotPassword/UpdatePassword?username=" + username);

        } else {
            // Nếu mật khẩu không hợp lệ, hiển thị thông báo lỗi trên trang ForgotPassword.jsp
            HttpSession session = req.getSession();
            session.setAttribute("error", "Mật khẩu gần nhất không hợp lệ hoặc không trùng khớp với mật khẩu trong cơ sở dữ liệu.");
            resp.sendRedirect(req.getContextPath() + "/Trangchu/SignUpIn/ForgotPassword");
        }

    }

    private boolean isValidPassword(String username, String lastPassword) {
        // Lấy mật khẩu từ database dựa trên username
        String passwordFromDB = ClientBO.getPassFromUser(username, lastPassword);
        
        // Kiểm tra xem mật khẩu gần nhất có chứa ít nhất "3" kí tự liên tiếp với mật khẩu trong database không
        if (passwordFromDB != null && containsConsecutiveChars(passwordFromDB, lastPassword, 3)) {
            // Trả về true nếu mật khẩu gần nhất trùng 3 chữ cái liên tiếp
            return true;
        }
        return false;
    }


    private boolean containsConsecutiveChars(String password, String lastPassword, int n) {
    	
        // Kiểm tra xem mật khẩu gần nhất có chứa ít nhất "n" kí tự liên tiếp với mật khẩu trong database không
        for (int i = 0; i <= password.length() - n; i++) {
            String subStr = password.substring(i, i + n);
            if (lastPassword.contains(subStr)) {
                return true;
            }
        }
        return false;
    }
}
