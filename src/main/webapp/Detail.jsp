<%@page import="model.DAOs.ClientDAO"%>
<%@page import="model.entities.Review"%>
<%@page import="model.DAOs.ProductDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Client"%>
<%@page import="model.entities.Product"%>
<%@page import="model.DAOs.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Detail Page</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-xgE0/POUJcwe+9ATnxesAPJMroJr5khL9xroZDTs0uiflV/6KA+6kN46Rko2Pz6rsVw0pfpx4p9QvXa9vPzT4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- Css Styles -->
<link rel="stylesheet"
	href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css"
	integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/cssdetails/style.css"
	type="text/css">

<style>
#tabs-1, #tabs-3 {
	color: white;
	padding: 20px;
}

.bg-white {
	background-color: #4d4d4d !important;
}

.btn-custom {
	background-color: black !important; /* Màu nền đen */
	color: white !important; /* Màu chữ trắng */
	border: none !important; /* Loại bỏ viền */
}

.btn-custom:hover {
	background-color: #333333 !important;
	/* Màu nền đen đậm hơn khi hover */
	color: white !important; /* Màu chữ trắng khi hover */
}
</style>



</head>

<body>
	<%@ include file="/Pages/MasterPage/Header.jsp"%>
	<!-- Page Preloder 
    <div id="preloder">
        <div class="loader"></div>
    </div>
-->
	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
					<div class="tip">2</div> </a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
					<div class="tip">2</div> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
			<a href="#">Login</a> <a href="#">Register</a>
		</div>
	</div>

	<%
	Product p = (Product) request.getAttribute("product");
	String productName = p.getName();
	Double productPrice = p.getSalePrice();
	Double productOldPrice = p.getPrice();
	String productDescription = p.getDescription();
	String productImage = p.getImage();
	String productImage1 = p.getImage1();
	String productImage2 = p.getImage2();
	String productImage3 = p.getImage3();
	Integer productId = p.getId();
	String productSpecification = p.getSpecification();

	ArrayList<Review> reviews = ReviewDAO.findByProductID(productId);
	Client currentUser = (Client) session.getAttribute("user");
	String loginMessage = (String) session.getAttribute("loginMessage");
	if (loginMessage != null) {
		session.removeAttribute("loginMessage");
	}
	
	%>

	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="#">Women’s</a></li>
                            <li><a href="#">Men’s</a></li>
                            <li class="active"><a href="./shop.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./product-details.html">Product Details</a></li>
                                    <li><a href="./shop-cart.html">Shop Cart</a></li>
                                    <li><a href="./checkout.html">Checkout</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                            <a href="#">Login</a>
                            <a href="#">Register</a>
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_heart_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    Header Section End -->

	<!-- Breadcrumb Begin 
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>Essential structured blazer</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
 -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">

		<div class="container">
			<div class="row">
				<div class="col-lg-6">

					<div class="product__details__pic">
						<div
							class="product__details__pic__left product__thumb nice-scroll">
							<a class="pt active" href="#product-1"> <img
								src="<%=productImage%>" alt="">
							</a> <a class="pt" href="#product-2"> <img
								src="<%=productImage1%>" alt="">
							</a> <a class="pt" href="#product-3"> <img
								src="<%=productImage2%>" alt="">
							</a> <a class="pt" href="#product-4"> <img
								src="<%=productImage3%>" alt="">
							</a>
						</div>
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img"
									src="<%=productImage%>" alt=""> <img
									data-hash="product-2" class="product__big__img"
									src="<%=productImage1%>" alt=""> <img
									data-hash="product-3" class="product__big__img"
									src="<%=productImage2%>" alt=""> <img
									data-hash="product-4" class="product__big__img"
									src="<%=productImage3%>" alt="">
							</div>
						</div>
					</div>
				</div>
					<div class="product__details__text">
						<h3><%=productName%><span>Giá và khuyến mãi tại: Hà
								Nội</span>
						</h3>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <span>( 138 reviews )</span>
						</div>
						<div class="product__details__price"><%=productPrice%>
							<span><%=productOldPrice%></span>
						</div>
						<p>
							<img
								src="https://i.pinimg.com/originals/a0/86/47/a08647cec486718eaf66a38d6f6f8784.png"
								alt="icon" width="25" height="25"> Bộ sản phẩm gồm: Hộp,
							Sách hướng dẫn, Cây lấy sim, Cáp Type C
						</p>
						<p>
							<img src="https://cdn-icons-png.freepik.com/512/120/120846.png"
								alt="icon" width="20" height="20"> Hư gì đổi nấy 12 tháng
							tại 3254 siêu thị trên toàn quốc
						</p>
						<p>
							<img
								src="https://cdn-icons-png.flaticon.com/512/2510/2510687.png"
								alt="icon" width="30" height="30"> Bảo hành chính hãng 1
							năm
						</p>
						<p>
							<img
								src="https://uxwing.com/wp-content/themes/uxwing/download/logistics-shipping-delivery/truck-delivered-icon.png"
								alt="icon" width="30" height="30"> Giao hàng nhanh toàn
							quốc Xem chi tiết
						</p>
						<p>
							<img
								src="https://www.iconpacks.net/icons/1/free-phone-icon-1-thumb.png"
								alt="icon" width="30" height="30"> Tổng đài: 1900.9696.42
							(7:30 - 22:00)
						</p>


						<div class="product__details__button">
							<div class="quantity">
								<span>Số lượng:</span>
								<div class="pro-qty">
									<input type="number" id="quantity" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"
								onclick="addToCartFromDetail(<%=productId%>)"> <span></span>
								Mua Ngay
							</a>

							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
							</ul>
						</div>


						<div class="product__details__widget">
							<ul>
								<li><span>Còn hàng:</span>
									<div class="stock__checkbox">
										<label for="stockin"> In Stock <input type="checkbox"
											id="stockin"> <span class="checkmark"></span>
										</label>
									</div></li>
								<li><span>Màu sắc:</span>
									<div class="color__checkbox">
										<label for="red"> <input type="radio"
											name="color__radio" id="red" checked> <span
											class="checkmark"></span>
										</label> <label for="black"> <input type="radio"
											name="color__radio" id="black"> <span
											class="checkmark black-bg"></span>
										</label> <label for="grey"> <input type="radio"
											name="color__radio" id="grey"> <span
											class="checkmark grey-bg"></span>
										</label>
									</div></li>
							<!-- 	<li><span>Available size:</span>
									<div class="size__btn">
										<label for="xs-btn" class="active"> <input
											type="radio" id="xs-btn"> xs
										</label> <label for="s-btn"> <input type="radio" id="s-btn">
											s
										</label> <label for="m-btn"> <input type="radio" id="m-btn">
											m
										</label> <label for="l-btn"> <input type="radio" id="l-btn">
											l
										</label>
									</div></li> -->	
								<li><span>Ưu đãi:</span>
									<p>Miễn phí vận chuyển cho đơn hàng dưới 5km</p></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab"><span
									class="white-text">Mô tả</span></a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab"><span class="white-text">Thông
										số kỹ thuật</span></a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab"><span class="white-text">Đánh
										giá sản phẩm </span></a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<p><%=productDescription%></p>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="custom-specification-container">
									<%=productSpecification%>
								</div>
							</div>



							<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
    <a href="#" class="btn btn-outline-primary btn-sm float-right">Top Rated</a>
    
    
    <% for (Review review : reviews) {
    	  String clientName = ClientDAO.getClientNameById(review.getClientID());%>
    <div class="reviews-members pt-4 pb-4">
        <div class="media">
            <div class="media-body">
                <div class="reviews-members-header">
                     <%--  <span class="star-rating float-right"> 
                        <%-- Insert star rating logic here based on review's rating 
                        <% for (int i = 0; i < review.getRating(); i++) { %>
                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                        <% } %>
                        <% for (int i = review.getRating(); i < 5; i++) { %>
                            <a href="#"><i class="icofont-ui-rating"></i></a>
                        <% } %>
                    </span> --%>
                    <h6 class="mb-1">
                        <a class="text-black" href="#"><%= clientName %></a>
                    </h6>
                    <p class="text-gray"><%= review.getDatetime() %></p>
                </div>
                <div class="reviews-members-body">
                    <p><%= review.getComment() %></p>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <% } %>
    
    <a class="text-center w-100 d-block mt-4 font-weight-bold" href="#">Xem thêm</a>
</div>

								
								<br>
								<div
									class="bg-white rounded shadow-sm p-4 mb-5 rating-review-select-page">
									<h5 class="mb-4">Bạn đánh giá sao về sản phẩm này</h5>
									  <%-- <p class="mb-2">Rate the Place</p>
									<div class="mb-4">
										<span class="star-rating"> <a href="#"><i
												class="icofont-ui-rating icofont-2x"></i></a> <a href="#"><i
												class="icofont-ui-rating icofont-2x"></i></a>0 <a href="#"><i
												class="icofont-ui-rating icofont-2x"></i></a> <a href="#"><i
												class="icofont-ui-rating icofont-2x"></i></a> <a href="#"><i
												class="icofont-ui-rating icofont-2x"></i></a>
										</span>
									</div> --%>
									<%
									if (loginMessage != null) {
									%>
									<p style="color: red;"><%=loginMessage%></p>
									<%
									}
									%>
									<form action="submitReview" method="post"
										onsubmit="return submitComment()">
										<div class="form-group">
											<label>Đánh giá & nhận xét của bạn</label>
											<textarea class="form-control" name="comment"></textarea>
										</div>
										<div class="form-group">
											<input type="hidden" name="productId"
												value="<%=productId%>">
											<button class="btn btn-primary btn-sm btn-custom"
												type="submit">Gửi đánh giá</button>
										</div>
									</form>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			
			
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Instagram Begin -->
	<div class="instagram">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-1.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-2.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-3.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-4.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-5.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-6.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-7">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt cilisis.</p>
						<div class="footer__payment">
							<a href="#"><img src="img/payment/payment-1.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-2.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-3.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-4.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-5.png" alt=""></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-5">
					<div class="footer__widget">
						<h6>Quick links</h6>
						<ul>
							<li><a href="#">About</a></li>
							<li><a href="#">Blogs</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-4">
					<div class="footer__widget">
						<h6>Account</h6>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Orders Tracking</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Wishlist</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-8 col-sm-8">
					<div class="footer__newslatter">
						<h6>NEWSLETTER</h6>
						<form action="#">
							<input type="text" placeholder="Email"> < type="submit"
							class="site-btn">Subscribe
							</button>
						</form>
						<div class="footer__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<div class="footer__copyright__text">
						<p>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
					</div>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>

	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/mixitup.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/jquery.countdown.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/jquery.slicknav.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/jssdetail/main.js"></script>

	<script>	
	function addToCartFromDetail(productId) {
	    var quantity = document.getElementById("quantity").value;
	    // Thực hiện hành động thêm sản phẩm vào giỏ hàng với số lượng từ trang Detail.jsp
	    // Sử dụng đường dẫn tuyệt đối từ gốc ứng dụng web
	    window.location.href = '${pageContext.request.contextPath}/add-to-cart?action=addFromDetail&id=' + productId + '&quantity=' + quantity;
	}
	
	  function submitComment() {
	        var isLoggedIn = <%=currentUser != null%>;
	        if (!isLoggedIn) {
	            alert("Vui lòng đăng nhập để nhận xét sản phẩm.");
	            return false; // Ngăn form được submit
	        }
	    }


</script>
</body>

</html>