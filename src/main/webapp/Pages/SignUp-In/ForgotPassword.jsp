<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
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

<title>Forgot Password</title>
</head>
<body>

    <!-- Phần container cho form đăng nhập -->
    <div class="container" id="containerIn"
        style="width: 500px; min-height: 440px;">

        <div class="form-container sign-in-container" style="width: 100%;">
            <form method="post">
                <h1>Nhập mật khẩu gần nhất</h1>
                <br> 
                <input type="text" style="display: none" name="account"
                    value="login" /> 
                <input type="text" placeholder="Tài khoản"
                    name="user" required /> 
                <input type="password"
                    placeholder="Mật khẩu gần nhất" name="password" required /> <br>
                <button>Lấy lại mật khẩu</button>
                <br> 
            </form>
        </div>
    </div>

</body>
</html>
