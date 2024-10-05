//package controllers;
//
//import java.io.IOException;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet(urlPatterns = "/Logout")
//public class LogOutServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Xóa thông tin tài khoản khỏi session
//        HttpSession session = req.getSession();
//        session.removeAttribute("accesser");
//        session.removeAttribute("user");
//        session.invalidate(); // Xóa session hoàn toàn
//        
//        // Chuyển hướng về trang đăng nhập
//        resp.sendRedirect(req.getContextPath() + "/WebShop/TrangChu");
//    }
//}
