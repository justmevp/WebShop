package controllers;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.BOs.ClientBO;

@WebServlet("/Trangchu/SignUpIn/ForgotPassword/UpdatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward request và response tới trang ForgotPassword.jsp
        req.getRequestDispatcher("/Pages/SignUp-In/UpdatePassword.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 
    	// Lấy thông tin từ request
        String username = req.getParameter(	"username");
        String newPassword = req.getParameter("newPassword");
        String confirmNewPassword = req.getParameter("confirmNewPassword");

        // Kiểm tra xem mật khẩu mới và mật khẩu xác nhận có khớp nhau không
        if (!newPassword.equals(confirmNewPassword)) {
        	req.setAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp nhau.");
        	req.getRequestDispatcher("/UpdatePassword.jsp").forward(req, resp);
            return;
        }

        boolean success = ClientBO.updatePassword(username, newPassword);
		if (success) {
		    // Nếu cập nhật thành công, chuyển hướng đến trang thông báo thành công
		    resp.sendRedirect(req.getContextPath() + "/SignUpIn.jsp");
		} else {
		    // Nếu không thành công, hiển thị thông báo lỗi trên trang cập nhật mật khẩu
		    req.setAttribute("error", "Cập nhật mật khẩu thất bại. Vui lòng thử lại.");
		    req.getRequestDispatcher("/UpdatePassword.jsp").forward(req, resp);
		}
    }
}
