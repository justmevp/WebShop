package controllers;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.BOs.ClientBO;
import model.entities.Client;
import model.entities.Product;

@WebServlet(urlPatterns = "/Trangchu/SignUpIn")
public class SignUpInServlet extends HttpServlet {
    // Khai báo một danh sách sản phẩm để sử dụng trong Servlet
    ArrayList<Product> productList = new ArrayList<Product>();
    // Khai báo tên đăng nhập và mật khẩu của người quản trị hệ thống
    private String userAdmin = "Admin";
    private String passAdmin = "0123456789";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Thiết lập encoding cho request và response
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        // Tạo hoặc lấy ra session
        HttpSession ses = req.getSession();
        // Thiết lập các thuộc tính cần thiết cho session
        ses.setAttribute("accesser", "unknow");
        ses.setAttribute("error", null);
        // Forward request và response tới trang SignUpIn.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Pages/SignUp-In/SignUpIn.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Thiết lập encoding cho request và response
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        // Lấy thông tin tài khoản từ request
        String account = (String) req.getParameter("account");
        String user = null, pass = null, accesser = null;
        // Tạo hoặc lấy ra session
        HttpSession ses = req.getSession();
        // Xử lý tùy thuộc vào loại tài khoản được yêu cầu
        switch (account) {
        case "client":
            // Nếu là tài khoản người dùng, lấy thông tin từ request
            user = (String) req.getParameter("user");
            pass = (String) req.getParameter("password");
            String name = (String) req.getParameter("fullName");
            String address = (String) req.getParameter("address");
            String phone = (String) req.getParameter("phone");
            String repass = (String) req.getParameter("repass");
          
            // Tạo một đối tượng Client và thêm vào cơ sở dữ liệu
            Client client = new Client(0, user, pass, repass, "0", name, address, phone, 0, 0);
            ClientBO.addClientToData(client);
            // Thiết lập các thuộc tính cho session và chuyển hướng đến trang chủ
            ses.setAttribute("accesser", "user"); // Thiết lập quyền truy cập là user
            ses.setAttribute("user", client);
            resp.sendRedirect(req.getContextPath() + "/Trangchu");
            break;

        case "login":
            // Nếu là yêu cầu đăng nhập, lấy thông tin từ request
            user = (String) req.getParameter("user");
            pass = (String) req.getParameter("password");
            // Kiểm tra xem có phải là tài khoản người dùng hay không
            Client object1 = ClientBO.getAccesser(user, pass);
            if (object1 != null) {
                // Nếu là tài khoản người dùng, thiết lập các thuộc tính cho session và kết thúc
                ses.setAttribute("accesser", "user");
                ses.setAttribute("user", object1);
                // Thiết lập biến session loggedIn thành true
                ses.setAttribute("loggedIn", true);
                break;
            }
            // Nếu không phải là người dùng, thiết lập thông báo lỗi và chuyển hướng đến trang đăng nhập
            ses.setAttribute("error", "Thông tin đăng nhập không đúng. Vui lòng kiểm tra và thử lại.");
            req.getRequestDispatcher("/Pages/SignUp-In/SignUpIn.jsp").forward(req, resp);
            break;

        case "logout":
            // Xóa biến session loggedIn
            ses.removeAttribute("loggedIn");
            // Xóa thông tin tài khoản khỏi session
            ses.removeAttribute("accesser");
            ses.removeAttribute("user");
            // Chuyển hướng về trang đăng nhập
            resp.sendRedirect(req.getContextPath() + "/Trangchu");
            break;
        }

        // Kiểm tra quyền truy cập của người dùng và chuyển hướng tới trang tương ứng
        accesser = (String) ses.getAttribute("accesser");
        if (account.equals("login")) {
            if (user.equals(userAdmin) && pass.equals(passAdmin)) {
                // Nếu là quản trị viên, thiết lập quyền truy cập và chuyển hướng tới trang quản trị
                ses.setAttribute("error", null);
                ses.setAttribute("accesser", "admin");
                resp.sendRedirect(req.getContextPath() + "/Admin");
            } else if (accesser.equals("user")) {
                // Nếu là người dùng, thiết lập quyền truy cập và chuyển hướng tới trang chủ
                ses.setAttribute("error", null);
                resp.sendRedirect(req.getContextPath() + "/Trangchu");
            } else {
                // Nếu không xác định được quyền truy cập, thiết lập thông báo lỗi và chuyển hướng tới trang đăng nhập
                ses.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng.");
                resp.sendRedirect(req.getContextPath() + "/Pages/SignUp-In/SignUpIn.jsp");
            }
        }
    }
}
