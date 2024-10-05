<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="model.BOs.ClientBO"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.BOs.CartBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.entities.Product"%>
<%@page import="model.entities.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Import các thư viện và tệp tin CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/css/bullma_css.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
/* Định dạng cho Navbar */
.navbar {
	font-size: large;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 999;
	padding: 0;
}

.navbar-dropdown .navbar-item p {
	color: #000000;
	font-family: BlinkMacSystemFont, sans-serif; /* Màu đen */
}

/* Hiển thị dropdown khi di chuột qua phần tài khoản */
.account:hover .nav-account {
	display: block;
}

/* Ẩn phần tài khoản mặc định */
.nav-account {
	display: none;
}

/* Định dạng cho thẻ chứa thương hiệu */
.navbar-brand {
	padding: 0;
}

/* Xóa gạch chân của liên kết */
a {
	text-decoration: none !important;
}

/* Định dạng cho phần dropdown lớn */
.navbar-item.is-mega {
	position: static;
}

/* Định dạng cho tiêu đề của dropdown lớn */
.navbar-item.is-mega .is-mega-menu-title {
	margin-bottom: 0;
	padding: 0.375rem 1rem;
}

/* Định dạng cho phần lọc sản phẩm */
.filterDiv {
	float: left;
	background-color: #2196F3;
	color: #ffffff;
	width: 100px;
	line-height: 100px;
	text-align: center;
	margin: 2px;
	display: none;
}

/* Hiển thị các phần tử */
.show {
	display: block;
}

/* Định dạng cho container */
.container {
	margin-top: 20px;
	overflow: hidden;
}

/* Định dạng cho nút */
.btn {
	border: none;
	outline: none;
	padding: 12px 16px;
	background-color: #f1f1f1;
	cursor: pointer;
}

/* Định dạng khi di chuột qua nút */
.btn:hover {
	background-color: #ddd;
}

/* Định dạng khi nút được chọn */
.btn.active {
	background-color: #666;
	color: white;
}

/* Ẩn phần tử trên desktop */
.is-hidden-desktop-only:hover {
	opacity: 0.5;
}

/* Định dạng cho liên kết trong thanh điều hướng */
.nav>.nav-item>.nav-link {
	padding: 12px 16px;
}

/* Ẩn phần tử */
.close {
	display: none;
}
</style>

<!-- navigation-header -->
<%
// Tạo session và kiểm tra quyền truy cập
HttpSession ses = request.getSession();
String accesser = (String) ses.getAttribute("accesser");

// Khởi tạo đối tượng client và danh sách hàng trong giỏ
Client client = null;
ArrayList<Cart> itemsCartList = new ArrayList<Cart>();

// Khởi tạo danh sách các danh mục sản phẩm
ArrayList<Category> categoryList = new ArrayList<Category>();

// Lấy danh sách các danh mục sản phẩm từ lớp xử lý Logic (BO)
categoryList = CategoryBO.getCategorysInData();

// Kiểm tra quyền truy cập và lấy thông tin tài khoản người dùng (nếu có)
if (accesser != null && accesser.equals("user")) {
	client = (Client) ses.getAttribute("user");
	client = client != null ? ClientBO.getClientById(client.getId()) : null;
	itemsCartList = client != null ? (ArrayList<Cart>) CartBO.getItemsCartByClient(client.getId()) : null;
	ses.setAttribute("itemsCartList", itemsCartList);
}
%>

<nav class="navbar " style="background-color: #000000;">
	<!-- Phần header của Navbar -->
	<div class="navbar-brand">
		<!-- Liên kết đến trang chủ -->
		<a class="navbar-item" href="<%=request.getContextPath()%>/Trangchu"
			style="color: #FFFF; font-size: 18px"> Trang chủ </a>
		<!-- Nút burger để mở menu -->
		<div class="navbar-burger burger" data-target="navMenubd-example">
			<span></span> <span></span> <span></span>
		</div>
	</div>

	<div id="navMenubd-example" class="navbar-menu">
		<div class="navbar-start">
			<div class="navbar-item has-dropdown is-hoverable is-mega">
				<a class="navbar-link flex" style="color: #FFFF;" href="#">Sản
					Phẩm</a>
				<div id="blogDropdown" class="navbar-dropdown"
					data-style="width: 18rem;">
					<div class="container is-fluid">
						<div class="columns">
							<div class="column">
								<%
								int count = 0;
								for (Category category : categoryList) {
									count++;
								%>
								<a class="navbar-item" href="javascript:void(0);"
									onclick="setCategorySession(<%=category.getCid()%>, '<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=<%=category.getCid()%>')">
									<p><%=category.getCname()%></p>
								</a>
								<%
								if (count == 4) {
									out.print("</div><div class='column'>");
									count = 0;
								}
								}
								%>
							</div>
						</div>
					</div>


					<!-- Phần phân cách giữa menu danh mục sản phẩm và các phần khác -->
					<hr class="navbar-divider">
					<!-- Phần nút Subscribe -->
					<div class="navbar-item">
						<div class="navbar-content">
							<div class="level is-mobile">
								<div class="level-left">
									<div class="level-item">
										<strong></strong>
									</div>
								</div>
								<div class="level-right">
									<div class="level-item"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Dropdown cho phần Hỗ Trợ -->
			<div class="navbar-item has-dropdown is-hoverable">
				<div class="navbar-link" style="color: #FFFF;">Hỗ Trợ</div>
				<!-- Dropdown menu cho phần Hỗ Trợ -->
				<div id="moreDropdown" class="navbar-dropdown ">
					<a class="navbar-item " href="http://bulma.io/extensions/">
						<div class="level is-mobile">
							<div class="level-left">
								<div class="level-item">
									<strong>HOTLINE <i class="fa fa-volume-control-phone"
										aria-hidden="true"></i></strong>
									<p style="padding-left: 20px; font-size: large;">0111244899</p>
								</div>
							</div>
							<div class="level-right">
								<div class="level-item">
									<span class="icon has-text-info"> </span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>


		<!-- Nút Quản lý sản phẩm -->
		<%
		Client user = (Client) session.getAttribute("user");
		if (user != null && user.getIsSell() == 1) {
		%>
		<!-- Nút Quản lý sản phẩm -->
		<a class="navbar-item"
			href="<%=request.getContextPath()%>/Trangchu/OwnerShop"
			style="color: #FFFF;"> Quản lý sản phẩm </a>
		<%
		}
		%>



		<%
		if (client != null) {
		%>
		<div class="navbar-item">
			<div class="field is-grouped">
				<form action="<%=request.getContextPath()%>/Trangchu/SignUpIn"
					method="post">
					<input type="hidden" name="account" value="logout">
					<button class="button is-primary" type="submit"
						style="background-color: transparent; border: none; cursor: pointer;">
						<span style="color: #FFFF;">Đăng xuất</span>
					</button>
				</form>
			</div>
		</div>
		<%
		}
		%>


		<!-- Phần cuối cùng của Navbar -->
		<div class="navbar-end">
			<!-- Liên kết đến trang giỏ hàng -->
			<a class="navbar-item "
				href="<%=request.getContextPath()%>/Trangchu/GioHang" onclick="setPreviousPageToHome()"
				style="color: #FFFF;"> <!-- Biểu tượng giỏ hàng --> <span
				<%=client == null || itemsCartList.size() == 0 ? "class=\"close\"" : ""%>
				style="height: 18px; background-color: darkorange; width: 18px; border-radius: 50%; position: absolute; left: 0; top: 10px; font-size: small; font-size: small; text-align: center;">
					<%
					if (client != null) {
						out.print(itemsCartList.size());
					}
					%>
			</span> <i class="fa fa-shopping-cart" aria-hidden="true"
				style="font-size: 18px;"></i>
			</a>



			<!-- Phần đăng nhập/đăng ký -->
			<div class="navbar-item">
				<div class="field is-grouped">
					<p class="control">
						<!-- Phần điều khiển là một phần tử có thể tương tác -->
						<!-- Link tới trang đăng nhập hoặc trang tài khoản của người dùng -->
						<a class="button is-primary account"
							href="<%=request.getContextPath()%>/Trangchu/SignUpIn"> <!-- Hiển thị tên đăng nhập hoặc "Tài Khoản" nếu chưa đăng nhập -->
							<span style="color: #FFFF;"> <%
 if (client != null)
 	out.print(client.getFullName());
 else
 	out.print("");
 %> <!-- Biểu tượng người dùng --> <i class="fa fa-user"
								aria-hidden="true" style="font-size: 18px; display: contents"></i>
						</span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
function setCategorySession(categoryID, redirectUrl) {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', redirectUrl + '&setSession=' + categoryID, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            window.location.href = redirectUrl;
        }
    };
    xhr.send();
}

function setPreviousPageToHome() {
    // Gửi yêu cầu AJAX để đặt previousPage thành Home.jsp
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "<%=request.getContextPath()%>/set-previous-page?previousPage=Home.jsp", true);
    xhr.send();
}

</script>
