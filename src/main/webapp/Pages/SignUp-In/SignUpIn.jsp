<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Link CSS từ thư viện Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<!-- Link CSS tùy chỉnh -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/assets/css/stylePageSignIN_UP.css" />
<title>Shop</title>
</head>
<body>
    <!-- Button chuyển đổi giữa Đăng nhập và Đăng kí -->
    <div class="function">
        <button id="in">Đăng nhập</button>
        <button id="up">Đăng kí</button>
    </div>
    
    <!-- Hiển thị thông báo lỗi -->
    <% String error = (String) session.getAttribute("error");
    if (error != null && !error.isEmpty()) { %>
        <div class="error-message">
            <%= error %>
        </div>
    <% } %>
    
    <!-- Link trở về trang chủ -->
    <a href="<%=request.getContextPath()%>/Trangchu">← Trở về trang chủ</a>
    
    <!-- Phần container cho form đăng kí và đăng nhập -->
    <div class="container close" id="container">
        <!-- Form đăng kí -->
        <div class="form-container sign-up-container">
            <!-- Button đóng form -->
            <h1 class="header--iconclose js--close--pay"
                style="padding: 16px; position: absolute; top: 0; right: 0; cursor: pointer;">
                <i class="fa fa-times" style="font-size: 18px;"></i>
            </h1>
        </div>
        
        <!-- Form đăng kí -->
        <div class="form-container sign-in-container">
            <form method="post" id="signupForm" onsubmit="return validateForm()">
                <h1>Đăng kí tài khoản</h1>
                <br> 
                <span>hoặc dùng tài khoản của bạn</span>
                
                <!-- Các nút đăng kí bằng mạng xã hội -->
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/LoginGoogle&response_type=code
           &client_id=313734681110-olaehiktl6bl0gmnejr9jujlljkecbqv.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                
                <!-- Các trường thông tin đăng kí -->
                <input type="text" style="display: none" name="account" value="client" />
                <input type="text" placeholder="Nhập tên người dùng (không quá 20 kí tự)" name="user" maxlength="20" required />
                <input type="password" placeholder="Nhập mật khẩu" id="password" name="password" required />
                <input type="password" placeholder="Nhập lại mật khẩu" id="confirmPassword" name="repass" required />
                <input type="text" placeholder="Nhập họ và tên" id="fullName" name="fullName" required />
                <input type="text" placeholder="Nhập địa chỉ" name="address" required />
                <input type="text" placeholder="Nhập số điện thoại" id="phone" name="phone" required />
                
                <!-- Button đăng kí -->
                <button type="submit">Đăng kí</button>
            </form>
        </div>
    </div>

    <!-- Phần container cho form đăng nhập -->
    <div class="container" id="containerIn" style="width: 500px; min-height: 440px;">
        <div class="form-container sign-in-container" style="width: 100%;">
            <form method="post">
                <h1>Đăng nhập tài khoản</h1>
                <br> 
                <input type="text" style="display: none" name="account" value="login" /> 
                <input type="text" placeholder="Tài khoản" name="user" required /> 
                <input type="password" placeholder="Mật khẩu" name="password" required /> 
<a href="<%=request.getContextPath()%>/Trangchu/SignUpIn/ForgotPassword" style="text-decoration: none; color: blue;">Quên mật khẩu?</a>
                   
                <!-- Hiển thị thông báo lỗi -->
                <div id="loginError" style="color: red; display: none;">Thông tin đăng nhập không đúng. Vui lòng kiểm tra và thử lại.</div>
                
                <!-- Button đăng nhập -->
                <button>Đăng nhập</button>
                <br> 
                <span>hoặc đăng nhập bằng</span>
                
                <!-- Các nút đăng nhập bằng mạng xã hội -->
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/WebShop/LoginGoogle&response_type=code
           &client_id=313734681110-olaehiktl6bl0gmnejr9jujlljkecbqv.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </form>
        </div> 
    </div>
    
    <!-- Script kiểm tra và chuyển đổi giữa form đăng nhập và form đăng kí -->
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var uppercaseRegex = /[A-Z]/;
            var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
            
            if (password.length < 8 || password.length > 25) {
                alert("Mật khẩu phải có ít nhất từ 8 đến 25 kí tự.");
                return false;
            }
            
            if (!uppercaseRegex.test(password)) {
                alert("Mật khẩu phải chứa ít nhất 1 chữ cái viết hoa.");
                return false;
            }
            
            if (!specialCharRegex.test(password)) {
                alert("Mật khẩu phải chứa ít nhất 1 kí tự đặc biệt.");
                return false;
            }

            var fullName = document.getElementById("fullName").value;
            var nameRegex = /^[a-zA-ZÀ-ỹ\s]+$/;
            if (!nameRegex.test(fullName)) {
                alert("Tên không hợp lệ.");
                return false;
            }
            
            var phoneNumber = document.getElementById("phone").value;
            var numberRegex = /^[0-9]{1,12}$/;
            if (!numberRegex.test(phoneNumber)){
                alert("Số điện thoại không hợp lệ.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Mật khẩu xác thực lại không trùng khớp.");
                return false;
            }

            return true;
        }

        const container = document.getElementById('container');
        const containerIn = document.getElementById('containerIn');
        const signIn = document.getElementById('in');
        const signUp = document.getElementById('up');
        
        signIn.addEventListener('click',()=>{
            containerIn.classList.remove('close');
            container.classList.add('close');
        })
        
        signUp.addEventListener('click',()=>{
            container.classList.remove('close');
            containerIn.classList.add('close');
        })        
    </script>
</body>
</html>
