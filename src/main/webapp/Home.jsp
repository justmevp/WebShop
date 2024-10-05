<%@page import="config.ConnectionSQL"%>
<%@page import="model.BOs.ProductBO"%>
<%@page import="model.DAOs.ProductDAO"%>
<%@page import="model.entities.Product"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
	
<%
ArrayList<Product> productList = new ArrayList<Product>();
ArrayList<Client> clientList = new ArrayList<Client>();
clientList = (ArrayList<Client>) request.getAttribute("clientList");
%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>

<%! 
    // Define a method to format currency
    public String formatCurrency(Object price) {
        if (price == null) {
            return "0";
        }
        double amount = Double.parseDouble(price.toString());
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return formatter.format(amount);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Electro - HTML Ecommerce Template</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/bootstrap.min.css"
	type="text/css">

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/slick.css"
	type="text/css">


<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/slick-theme.css"
	type="text/css">


<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/nouislider.min.css"
	type="text/css">


<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/font-awesome.min.css"
	type="text/css">


<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/homecss/style.css"
	type="text/css">


  <style>
        .header-search .input-group {
            width: 100%;
            display: flex;
        }

        .header-search .input-group .form-control.input {
            flex: 1;
        }

        
    </style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<%@ include file="/Pages/MasterPage/Header.jsp"%>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
						<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
					</ul>
				</div>
			</div>
		TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
    <div class="header-search">
        <form id="search-form" action="<%=request.getContextPath()%>/Trangchu/ProductMenu" method="GET">
            <div class="input-group">
                <input class="form-control input" name="search" placeholder="Search here">
                <button type="submit" class="btn btn-outline-secondary search-btn">Search</button>
            </div>
        </form>
    </div>
</div>
					<!-- /SEARCH BAR -->


				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION 

		<div class="container">
			
			<div id="responsive-nav">
			
				<ul class="main-nav nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Hot Deals</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="#">Laptops</a></li>
					<li><a href="#">Smartphones</a></li>
					<li><a href="#">Cameras</a></li>
					<li><a href="#">Accessories</a></li>
				</ul>
				
			</div>
			
		</div>
		
	</nav>-->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img
								src="https://cdn.shopify.com/s/files/1/1696/1045/files/iphone_13_600x600.jpg?v=1659014469"
								alt="Iphone Advertisement">

						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>iPhone
							</h3>
							<a href="#" class="cta-btn">Mua sắm ngay <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img
								src="https://m-cdn.phonearena.com/images/articles/410385-image/Samsung-GalaxyS24-Series.jpg"
								alt="">
						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>Samsung
							</h3>
							<a href="#" class="cta-btn">Mua sắm ngay <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtOjDKDCi9Ydu_dDgdmEKhjRGs7Cz_jQSEtmSr1tkZjw&s"
								alt="">
						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>Oppo
							</h3>
							<a href="#" class="cta-btn">Mua sắm ngay<i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- category1 bar -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Điện Thoại Mới</h3>
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<!-- Hiển thị danh sách danh mục -->
								<%
								ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
								for (Category category : categories) {
								%>
								<li><a href="Trangchu?categoryId=<%=category.getCid()%>"><%=category.getCname()%></a>
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>
				<!-- /category1 bar -->

				<!-- Products tab & slick -->
<div class="col-md-12">
    <div class="row">
        <div class="products-tabs">
            <!-- tab -->
            <div id="tab1" class="tab-pane active">
                <div class="products-slick" data-nav="#slick-nav-1">
                    <%
                    ArrayList<Product> newestProducts = (ArrayList<Product>) request.getAttribute("newestProducts");
                    if (newestProducts != null) {
                        for (Product product : newestProducts) {
                    %>
                    <!-- product -->
                    <div class="product">
                        <div class="product-img">
                            <a href="Trangchu/Product?id=<%=product.getId()%>"> <img src="<%=product.getImage()%>" alt=""></a>
                            <div class="product-label">
                                <span class="sale">-30%</span> <span class="new">NEW</span>
                            </div>
                        </div>
                        <div class="product-body">
                            <!-- Hiển thị danh mục sản phẩm -->
                            <h3 class="product-name">
                                <a href="Trangchu/Product?id=<%=product.getId()%>"><%=product.getName()%></a>
                            </h3>
                            <h4 class="product-price"><%= formatCurrency(product.getPrice()) %></h4>
                            <div class="product-rating">
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist">
                                    <i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span>
                                </button>
                                <button class="add-to-compare">
                                    <i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span>
                                </button>
                                <button class="quick-view">
                                    <i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                                </button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn" onclick="addToCartFromHome('<%=product.getId()%>')">
                                <i class="fa fa-shopping-cart"></i> Mua Ngay
                            </button>
                        </div>
                    </div>
                    <!-- /product -->
                    <%
                        }
                    } else {
                        // Hiển thị danh mục sản phẩm của tab có cateID bằng 1 (iPhone)
                        ArrayList<Product> iphoneProducts = ProductDAO.getNewestProductsByCategory(1); // Thay 1 bằng cateID của iPhone
                        if (iphoneProducts != null && !iphoneProducts.isEmpty()) {
                            for (Product product2 : iphoneProducts) {
                    %>
                    <!-- product -->
                    <div class="product">
                        <div class="product-img">
                            <a href="Trangchu/Product?id=<%=product2.getId()%>"> <img src="<%=product2.getImage()%>" alt=""></a>
                            <div class="product-label">
                                <span class="sale">-30%</span> <span class="new">NEW</span>
                            </div>
                        </div>
                        <div class="product-body">
                            <!-- Hiển thị danh mục sản phẩm -->
                            <h3 class="product-name">
                                <a href="Trangchu/Product?id=<%=product2.getId()%>"><%=product2.getName()%></a>
                            </h3>
                            <h4 class="product-price"><%= formatCurrency(product2.getPrice()) %></h4>
                            <div class="product-rating">
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist">
                                    <i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span>
                                </button>
                                <button class="add-to-compare">
                                    <i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span>
                                </button>
                                <button class="quick-view">
                                    <i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                                </button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn" onclick="addToCartFromHome('<%=product2.getId()%>')">
                                <i class="fa fa-shopping-cart"></i> Mua Ngay
                            </button>
                        </div>
                    </div>
                    <!-- /product -->
                    <%
                            }
                        } else {
                    %>
                    <p>No products available.</p>
                    <%
                        }
                    }
                    %>
                </div>
                <div id="slick-nav-1" class="products-slick-nav"></div>
            </div>
            <!-- /tab -->
        </div>
    </div>
</div>
<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>02</h3>
									<span>Ngày</span>
								</div>
							</li>
							<li>
								<div>
									<h3>10</h3>
									<span>Giờ</span>
								</div>
							</li>
							<li>
								<div>
									<h3>34</h3>
									<span>Phút</span>
								</div>
							</li>
							<li>
								<div>
									<h3>60</h3>
									<span>Giây</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">Khuyến mãi tuần này</h2>
						<p>iphone giảm giá đến 50% </p>
						<a class="primary-btn cta-btn" href="#">Mua ngay</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Top selling</h3>
					</div>
				</div>
				<!-- /section title -->



				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<!-- product -->
									<div class="product">
										<%-- Thay thế ID 1 bằng ID của sản phẩm bạn muốn hiển thị --%>
										<%
										Product product = ProductBO.getProductByID(51); // Lấy sản phẩm từ cơ sở dữ liệu dựa trên ID
										if (product != null) {
										%>
										<div class="product-img">
											<a href="Trangchu/Product?id=<%=product.getId()%>"><img
												src="<%=product.getImage()%>" alt=""></a>
											<div class="product-label">
												<span class="sale">-30%</span> <span class="new">NEW</span>
											</div>
										</div>

										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name">
												<a href="#">"<%=product.getName()%>"
												</a>
											</h3>
											<h4 class="product-price">
												<%= formatCurrency(product.getSalePrice()) %>
												<del class="product-old-price"><%= formatCurrency(product.getPrice()) %></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"
												onclick="addToCartFromHome('<%=product.getId()%>')">
												<i class="fa fa-shopping-cart"></i> Mua ngay
											</button>
										</div>
										<%
										} else {
										%>
										<p>Sản phẩm không tồn tại.</p>
										<%
										}
										%>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<%-- Thay thế ID 1 bằng ID của sản phẩm bạn muốn hiển thị --%>
										<%
										Product product2 = ProductBO.getProductByID(57); // Lấy sản phẩm từ cơ sở dữ liệu dựa trên ID
										if (product != null) {
										%>
										<div class="product-img">
												<a href="Trangchu/Product?id=<%=product2.getId()%>"><img
												src="<%=product2.getImage()%>" alt=""></a>
											<div class="product-label">
												<span class="sale">-30%</span> <span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name">
												<a href="#">"<%=product2.getName()%>"
												</a>
											</h3>
											<h4 class="product-price">
												<%= formatCurrency(product2.getSalePrice()) %>
												<del class="product-old-price"><%= formatCurrency(product2.getPrice()) %></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"
												onclick="addToCartFromHome('<%=product2.getId()%>')">
												<i class="fa fa-shopping-cart"></i> Mua ngay
											</button>
										</div>
										<%
										} else {
										%>
										<p>Sản phẩm không tồn tại.</p>
										<%
										}
										%>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<%-- Thay thế ID 1 bằng ID của sản phẩm bạn muốn hiển thị --%>
										<%
										Product product3 = ProductBO.getProductByID(41); // Lấy sản phẩm từ cơ sở dữ liệu dựa trên ID
										if (product != null) {
										%>
										<div class="product-img">
												<a href="Trangchu/Product?id=<%=product3.getId()%>"><img
												src="<%=product3.getImage()%>" alt=""></a>
											<div class="product-label">
												<span class="sale">-30%</span> <span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name">
												<a href="#">"<%=product3.getName()%>"
												</a>
											</h3>
											<h4 class="product-price">
												<%= formatCurrency(product3.getSalePrice()) %>
												<del class="product-old-price"><%= formatCurrency(product3.getPrice()) %></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"
												onclick="addToCartFromHome('<%=product3.getId()%>')">
												<i class="fa fa-shopping-cart"></i> Mua ngay
											</button>
										</div>
										<%
										} else {
										%>
										<p>Sản phẩm không tồn tại.</p>
										<%
										}
										%>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<%-- Thay thế ID 1 bằng ID của sản phẩm bạn muốn hiển thị --%>
										<%
										Product product4 = ProductBO.getProductByID(53); // Lấy sản phẩm từ cơ sở dữ liệu dựa trên ID
										if (product != null) {
										%>
										<div class="product-img">
												<a href="Trangchu/Product?id=<%=product4.getId()%>"><img
												src="<%=product4.getImage()%>" alt=""></a>
											<div class="product-label">
												<span class="sale">-30%</span> <span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name">
												<a href="#">"<%=product4.getName()%>"
												</a>
											</h3>
											<h4 class="product-price">
												<%= formatCurrency(product4.getSalePrice()) %>
												<del class="product-old-price"><%= formatCurrency(product4.getPrice	()) %></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"
												onclick="addToCartFromHome('<%=product4.getId()%>')">
												<i class="fa fa-shopping-cart"></i> Mua ngay
											</button>
										</div>
										<%
										} else {
										%>
										<p>Sản phẩm không tồn tại.</p>
										<%
										}
										%>
									</div>
									<!-- /product -->
								</div>
								<div id="slick-nav-2" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<%
	// Lấy danh sách các sản phẩm giảm giá từ request attribute
	ArrayList<Product> saleProducts = (ArrayList<Product>) request.getAttribute("saleProducts");
	ArrayList<Product> saleProducts2 = (ArrayList<Product>) request.getAttribute("saleProducts2");
	ArrayList<Product> saleProducts3 = (ArrayList<Product>) request.getAttribute("saleProducts3");
	ArrayList<Product> saleProducts4 = (ArrayList<Product>) request.getAttribute("saleProducts4");
	%>

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">iPhone giảm sốc</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<div>
							<!-- Loop through saleProducts and display -->
							<%
							if (saleProducts != null) {
								for (Product iphone : saleProducts) {
							%>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
										<a href="Trangchu/Product?id=<%=iphone.getId()%>"><img
												src="<%=iphone.getImage()%>" alt=""></a>
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#"><%=iphone.getName()%></a>
									</h3>
									<h4 class="product-price">
										$<%=iphone.getSalePrice()%>
										<del class="product-old-price">
											$<%=iphone.getPrice()%></del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->
							<%
							}
							} else {
							%>
							<p>No discounted iPhones available.</p>
							<%
							}
							%>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">SAMSUNG giảm sốc</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- Loop through saleProducts2 and display -->
							<%
							if (saleProducts2 != null) {
								for (Product samsung : saleProducts2) {
							%>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
										<a href="Trangchu/Product?id=<%=samsung.getId()%>"><img
												src="<%=samsung.getImage()%>" alt=""></a>
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#"><%=samsung.getName()%></a>
									</h3>
									<h4 class="product-price">
										$<%=samsung.getSalePrice()%>
										<del class="product-old-price">
											$<%=samsung.getPrice()%></del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->
							<%
							}
							} else {
							%>
							<p>No discounted Samsung phones available.</p>
							<%
							}
							%>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">XIAOMI giảm sốc</h4>
						<div class="section-nav">
							<div id="slick-nav-5" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-5">
						<div>
							<!-- Loop through saleProducts3 and display -->
							<%
							if (saleProducts3 != null) {
								for (Product xiaomi : saleProducts3) {
							%>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
										<a href="Trangchu/Product?id=<%=xiaomi.getId()%>"><img
												src="<%=xiaomi.getImage()%>" alt=""></a>
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#"><%=xiaomi.getName()%></a>
									</h3>
									<h4 class="product-price">
										$<%=xiaomi.getSalePrice()%>
										<del class="product-old-price">
											$<%=xiaomi.getPrice()%></del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->
							<%
							}
							} else {
							%>
							<p>No discounted Xiaomi phones available.</p>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->


	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Đăng kí để nhận ngay ưu đãi <strong>tại đây</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Hãy điền email của bạn">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Đăng kí
							</button>
						</form>
					
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	

	<!-- jQuery Plugins -->

	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/jquery.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/slick.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/nouislider.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/jquery.zoom.min.js"></script>
	<script type="text/javascript"
		src="/WebShop/style/assets/homejs/main.js"></script>
	<script>
		function addToCartFromHome(productId) {
			// Thực hiện hành động thêm sản phẩm vào giỏ hàng ở đây
			// Ví dụ: chuyển hướng đến servlet và gửi yêu cầu thêm sản phẩm vào giỏ hàng từ trang home.jsp
			window.location.href = 'add-to-cart?action=addFromHome&id='
					+ productId;
		}

		$(document)
				.ready(
						function() {
							// Số lượng sản phẩm hiển thị trên mỗi slide
							var productsPerSlide = 3;

							// Lặp qua mỗi phần tử có class là 'products-widget-slick'
							$('.products-widget-slick')
									.each(
											function() {
												var $slick = $(this);

												// Kích thước của mỗi phần tử sản phẩm
												var productWidth = $slick.find(
														'.product-widget')
														.outerWidth(true);

												// Số lượng sản phẩm
												var productCount = $slick
														.find('.product-widget').length;

												// Số lượng slide cần tạo (tối đa 2 slide)
												var slideCount = Math
														.min(
																2,
																Math
																		.ceil(productCount
																				/ productsPerSlide));

												// Thêm slide cho slick carousel
												for (var i = 0; i < slideCount; i++) {
													// Tạo một slide mới
													var $slide = $('<div class="slick-slide"></div>');

													// Tính vị trí bắt đầu và kết thúc của sản phẩm trên slide này
													var start = i
															* productsPerSlide;
													var end = Math.min(start
															+ productsPerSlide,
															productCount);

													// Chọn các sản phẩm thuộc slide này và thêm vào slide
													$slide.append($slick.find(
															'.product-widget')
															.slice(start, end));

													// Thêm slide mới vào slick carousel
													$slick.slick('slickAdd',
															$slide);
												}
											});

							// Cấu hình Slick carousel để tự động lặp lại giữa các slide
							$('.products-widget-slick').slick({
								slidesToShow : 3, // Hiển thị 3 sản phẩm mỗi slide
								slidesToScroll : 1, // Số lượng sản phẩm được trượt qua mỗi lần
								infinite : true, // Lặp lại giữa các slide
								autoplay : true, // Tự động trượt
								autoplaySpeed : 3000, // Tốc độ tự động trượt (milliseconds)
							});
						});
		
		 document.addEventListener('DOMContentLoaded', function () {
		        const searchForm = document.getElementById('search-form');
		        const searchInput = searchForm.querySelector('input[name="search"]');
		        
		        searchForm.addEventListener('submit', function (event) {
		            event.preventDefault(); // Prevent form submission
		            
		            const searchTerm = searchInput.value.trim();
		            if (searchTerm !== '') {
		                const searchUrl = '<%=request.getContextPath()%>/Trangchu/ProductMenu?search=' + encodeURIComponent(searchTerm);
		                window.location.href = searchUrl; // Redirect to search URL
		            }
		        });
		    });
	</script>

	<%@ include file="/Pages/MasterPage/Footer.jsp"%>
</body>
</html>
