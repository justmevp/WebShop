<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Link CSS từ thư viện Font Awesome -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<!-- Link CSS tùy chỉnh -->
<link rel="stylesheet"
    href="<%=request.getContextPath()%>/style/assets/css/stylePageSignIN_UP.css" />
    
    <title>Cập nhật mật khẩu</title>
</head>
<body>

    
    
    <!-- Hiển thị thông báo lỗi nếu có -->
    <% String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) { %>
        <div style="color: red;"><%= error %></div>
    <% } %>
     <div class="container" id="containerIn"
        style="width: 500px; min-height: 440px;">

        <div class="form-container sign-in-container" style="width: 100%;">
    <!-- Form cập nhật mật khẩu -->
<form action="<%=request.getContextPath()%>/Trangchu/SignUpIn/ForgotPassword/UpdatePassword" method="post" onsubmit="return validateUpdatePasswordForm()">
     <h1>Tạo mật khẩu mới</h1>
     <br> 
        <!-- Ẩn trường username -->
        <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
<!-- Trường nhập mật khẩu mới -->
<label for="newPassword"></label>
<input type="password" id="newPassword" name="newPassword" placeholder="Mật khẩu mới" required>
<!-- Trường xác nhận mật khẩu mới -->
<label for="confirmNewPassword"></label>
<input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="Xác nhận mật khẩu mới" required><br>

        <!-- Nút submit -->
        <button>Cập nhật mật khẩu</button>
    </form>
     </div>
    </div>
 <script>
        function validateUpdatePasswordForm() {
            var password = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmNewPassword").value;

            var uppercaseRegex = /[A-Z]/;
            var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
            var digitRegex = /[0-9]/;

            if (password.length < 10 || password.length > 50) {
                alert("Mật khẩu phải có ít nhất từ 10 đến 50 kí tự.");
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

            if (!digitRegex.test(password)) {
                alert("Mật khẩu phải chứa ít nhất 1 chữ số.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Mật khẩu xác thực lại không trùng khớp.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
