<%@page import="model.entities.Order"%>
<%@page import="model.DAOs.OrderDAO"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Client"%>
<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Tables</title>
<!-- Thư viện và CSS của DataTables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<!-- Fontfaces CSS-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/css/font-face.css"
	media="all">
<link
	href="<%=request.getContextPath()%>/style/assets/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/style/assets/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/style/assets/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS -->
<link
	href="<%=request.getContextPath()%>/style/assets/css/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS -->
<link
	href="<%=request.getContextPath()%>/style/assets/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="<%=request.getContextPath()%>/style/assets/css/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/style/assets/css/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="<%=request.getContextPath()%>/style/assets/css/slick.css"
	rel="stylesheet" media="all">
<link href="<%=request.getContextPath()%>/style/assets/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/style/assets/css/perfect-scrollbar.css"
	rel="stylesheet" media="all">


<!-- Main CSS-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/css/theme.css"
	media="all">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js"
	integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css"
	integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg="
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

    
  
}
</style>
</head>
	
<body class="animsition">

	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<header class="header-mobile d-block d-lg-none">
			<div class="header-mobile__bar">
				<div class="container-fluid">
					<div class="header-mobile-inner">
						<a class="logo" href="index.html"> <img
							src="https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg" alt="CoolAdmin" />
						</a>
						<button class="hamburger hamburger--slider" type="button">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
			</div>
			<nav class="navbar-mobile">
				<div class="container-fluid">
					<ul class="navbar-mobile__list list-unstyled">
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>Danh Sách Đơn Hàng
						</a>
							<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
								<li><a href="index.html">Dashboard 1</a></li>
								<li><a href="index2.html">Dashboard 2</a></li>
								<li><a href="index3.html">Dashboard 3</a></li>
								<li><a href="index4.html">Dashboard 4</a></li>
							</ul></li>
						<li><a href="chart.html"> <i class="fas fa-chart-bar"></i>Quản Lý Sản Phẩm</a></li>
						<li><a href="table.html"> <i class="fas fa-table"></i>Tables
						</a></li>
						<li><a href="form.html"> <i class="far fa-check-square"></i>Forms
						</a></li>
						<li><a href="calendar.html"> <i
								class="fas fa-calendar-alt"></i>Calendar
						</a></li>
						<li><a href="map.html"> <i class="fas fa-map-marker-alt"></i>Maps
						</a></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-copy"></i>Pages
						</a>
							<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
								<li><a href="login.html">Login</a></li>
								<li><a href="register.html">Register</a></li>
								<li><a href="forget-pass.html">Forget Password</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-desktop"></i>UI Elements
						</a>
							<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
								<li><a href="button.html">Button</a></li>
								<li><a href="badge.html">Badges</a></li>
								<li><a href="tab.html">Tabs</a></li>
								<li><a href="card.html">Cards</a></li>
								<li><a href="alert.html">Alerts</a></li>
								<li><a href="progress-bar.html">Progress Bars</a></li>
								<li><a href="modal.html">Modals</a></li>
								<li><a href="switch.html">Switchs</a></li>
								<li><a href="grid.html">Grids</a></li>
								<li><a href="fontawesome.html">Fontawesome Icon</a></li>
								<li><a href="typo.html">Typography</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
			<div class="logo">
				<a href="#"> <img src="https://png.pngtree.com/png-clipart/20190629/original/pngtree-vector-administration-icon-png-image_4090499.jpg" alt="Cool Admin" width="50" height="50"/>
				</a>
			</div>
			<div class="menu-sidebar__content js-scrollbar1">
				<nav class="navbar-sidebar">
					<ul class="list-unstyled navbar__list">
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>Danh Sách Đơn Hàng
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a href="index.html">Dashboard 1</a></li>
								<li><a href="index2.html">Dashboard 2</a></li>
								<li><a href="index3.html">Dashboard 3</a></li>
								<li><a href="index4.html">Dashboard 4</a></li>
							</ul></li>
						<li><a href="chart.html"> <i class="fas fa-chart-bar"></i>Quản Lý Sản Phẩm
						</a></li>
					</ul>
				</nav>
			</div>
		</aside>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
		  	<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="text" name="search"
									placeholder="Search for datas &amp; reports..." />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
						
						</div>
					</div>
				</div>
			</header> 
			<!-- END HEADER DESKTOP-->

			<!-- MAIN CONTENT-->

			<%
			OrderDAO orderDAO = new OrderDAO();
			List<Order> orderList = orderDAO.getAllOrders();
			request.setAttribute("orderList", orderList);
			%>
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row" 	>

							<div class="col-lg-9">
								<div class="table-responsive table--no-card m-b-30">
									<table
										class="table table-borderless table-striped table-earning">
										<thead>
											<tr>
											   <th>Đã vận chuyển</th> 
												<th>Ngày đặt hàng</th>
												<th>ID đơn hàng</th>
												<th>Tên sản phẩm</th>
												<th class="text-right">Giá sản phẩm</th>
												<th class="text-right">Số lượng</th>
												<th class="text-right">Tổng giá tiền</th>
												<th>Người mua hàng</th>
												<th>Địa chỉ</th>
												<th>Số điện thoại</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (Order order : orderList) {
											%>
											<tr>
											 <td><input type="checkbox" name="shipped" value="<%=order.getOrderId()%>"></td> <!-- Thêm checkbox Đã vận chuyển -->
												<td><%=order.getDate()%></td>
												<td><%=order.getOrderId()%></td>
												<td><%=order.getName()%></td>
												<td class="text-right">$<%=order.getPrice()%></td>
												<td class="text-right"><%=order.getQunatity()%></td>
												<td class="text-right">$<%=order.getTotalPrice()%></td>
												<td><%=order.getBuyerName()%></td>
												<td><%=order.getAddress()%></td>
												<td><%=order.getPhone()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>


					 	<div class="col-lg-3">
								<div
									class="au-card au-card--bg-blue au-card-top-countries m-b-30">
									<div class="au-card-inner">
										<div class="table-responsive">
											<table class="table table-top-countries">
												<tbody>
													<tr>
														<td>United States</td>
														<td class="text-right">$119,366.96</td>
													</tr>
													<tr>
														<td>Australia</td>
														<td class="text-right">$70,261.65</td>
													</tr>
													<tr>
														<td>United Kingdom</td>
														<td class="text-right">$46,399.22</td>
													</tr>
													<tr>
														<td>Turkey</td>
														<td class="text-right">$35,364.90</td>
													</tr>
													<tr>
														<td>Germany</td>
														<td class="text-right">$20,366.96</td>
													</tr>
													<tr>
														<td>France</td>
														<td class="text-right">$10,366.96</td>
													</tr>
													<tr>
														<td>Australia</td>
														<td class="text-right">$5,366.96</td>
													</tr>
													<tr>
														<td>Italy</td>
														<td class="text-right">$1639.32</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div> 
						</div>
						<div class="row">
							<div class="col-lg-6">
							<!--   USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="filters m-b-45">
										<div
											class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="">Products</option>
												<option value="">Services</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div
											class="rs-select2--dark rs-select2--sm rs-select2--border">
											<select class="js-select2 au-select-dark" name="time">
												<option selected="selected">All Time</option>
												<option value="">By Month</option>
												<option value="">By Day</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>name</td>
													<td>role</td>
													<td>type</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role admin">admin</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option selected="selected">Full Control</option>
																<option value="">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox" checked="checked"> <span
															class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option value="">Full Control</option>
																<option value="" selected="selected">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option value="">Full Control</option>
																<option value="" selected="selected">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role member">member</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option selected="selected">Full Control</option>
																<option value="">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="user-data__footer">
										<button class="au-btn au-btn-load">load more</button>
									</div>
								</div>
								 END USER DATA
							</div>
							<div class="col-lg-6">
								<!-- TOP CAMPAIGN-->
								<div class="top-campaign">
									<h3 class="title-3 m-b-30">top campaigns</h3>
									<div class="table-responsive">
										<table class="table table-top-campaign">
											<tbody>
												<tr>
													<td>1. Australia</td>
													<td>$70,261.65</td>
												</tr>
												<tr>
													<td>2. United Kingdom</td>
													<td>$46,399.22</td>
												</tr>
												<tr>
													<td>3. Turkey</td>
													<td>$35,364.90</td>
												</tr>
												<tr>
													<td>4. Germany</td>
													<td>$20,366.96</td>
												</tr>
												<tr>
													<td>5. France</td>
													<td>$10,366.96</td>
												</tr>
												<tr>
													<td>3. Turkey</td>
													<td>$35,364.90</td>
												</tr>
												<tr>
													<td>4. Germany</td>
													<td>$20,366.96</td>
												</tr>
												<tr>
													<td>5. France</td>
													<td>$10,366.96</td>
												</tr>
												<tr>
													<td>3. Turkey</td>
													<td>$35,364.90</td>
												</tr>
												<tr>
													<td>4. Germany</td>
													<td>$20,366.96</td>
												</tr>
												<tr>
													<td>5. France</td>
													<td>$10,366.96</td>
												</tr>
												<tr>
													<td>4. Germany</td>
													<td>$20,366.96</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								  END TOP CAMPAIGN
							</div>
						</div>



						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">Bảng Quản Lý Sản Phẩm</h3>
								<div class="table-data__tool">
								  <div class="table-data__tool-left">
										<div class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div class="rs-select2--light rs-select2--sm">
											<select class="js-select2" name="time">
												<option selected="selected">Today</option>
												<option value="">3 Days</option>
												<option value="">1 Week</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<button class="au-btn-filter">
											<i class="zmdi zmdi-filter-list"></i>Filters
										</button>
									</div> 
									<div class="table-data__tool-right">
										<!-- Search Input -->
										<div class="input-group input-group-sm">
											<input id="searchInput" name="txt" type="text"
												class="form-control" placeholder="Search...">
											<div class="input-group-append">
												<button type="button" class="btn btn-secondary btn-number">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!--  PRODUCT DATA TABLE-->
						<div id="content" class="table-responsive table-responsive-data2">
							<table class="table table-data2">

								<thead>
									<tr>
										<th><label class="au-checkbox"> <input
												type="checkbox"> <span class="au-checkmark"></span>
										</label></th>
										<th>ID</th>
										<th>Tên sản phẩm</th>
										<th>Mô tả</th>
										<th>URL ảnh</th>
										<th>Loại sản phẩm</th>
										<th>Giá gốc</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<!-- Duyệt qua danh sách sản phẩm -->
									<%
									ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
									ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("listCC");
									if (productList != null)
										for (Product product : productList) {
									%>

									<tr class="tr-shadow">
										<td><label class="au-checkbox"> <input
												type="checkbox"> <span class="au-checkmark"></span>
										</label></td>
										<td><%=product.getId()%></td>
										<td><span class="block-email"><%=product.getName()%></span>
										</td>
										<td class="desc"><%=product.getDescription()%></td>
										<td style="max-width: 200px"><img
											src="<%=product.getImage()%>" alt="Product Image"
											style="max-width: 100%; height: auto;"></td>

										<td><span class="status--process"><%=product.getCateID()%>"><%=CategoryBO.getCategory(product.getCateID())%></span>
										</td>
										<td><%=product.getPrice()%></td>
										<td>
											<div class="table-data-feature">

												<form method="GET"
													action="<%=request.getContextPath()%>/Trangchu/OwnerShop"
													onsubmit="return validateForm()">
													<input type="hidden" name="id" value="<%=product.getId()%>" />
													<input type="hidden" name="action" value="edit" />
													<button type="submit" class="item" data-toggle="tooltip"
														data-placement="top" title="Edit">
														<i class="fa fa-wrench"></i>
													</button>
												</form>

												<form method="post"
													action="<%=request.getContextPath()%>/Trangchu/OwnerShop"
													onsubmit="return validateForm()">
													<input type="hidden" name="type" value="DELETE" /> <input
														type="hidden" name="pID" value="<%=product.getId()%>" />
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Delete">
														<i class="fa fa-trash" aria-hidden="true"></i>
													</button>
												</form>


												<button class="item" data-toggle="tooltip"
													data-placement="top" title="More">
													<i class="zmdi zmdi-more"></i>
												</button>
											</div>
										</td>
									</tr>
									<%
									}
									%>


								</tbody>
							</table>
							<form method="post"
								action="<%=request.getContextPath()%>/Trangchu/OwnerShop"
								onsubmit="return validateForm()">

								<div class="form-row">
									<div class="col-md-3 mb-3">
										<label for="name">Tên sản phẩm</label> <input type="text"
											class="form-control" id="name" name="name" autocomplete="off"
											required />
									</div>
									<div class="col-md-3 mb-3">
										<label for="price">Giá gốc</label> <input type="text"
											class="form-control" id="price" name="price"
											autocomplete="off" required />
									</div>
									<div class="col-md-3 mb-3">
										<label for="image">URL ảnh</label> <input type="text"
											class="form-control" id="image" name="image"
											autocomplete="off" required />
									</div>
									<div class="col-md-3 mb-3">
										<label for="description">Mô tả</label> <input type="text"
											class="form-control" id="description" name="description"
											autocomplete="off" />
									</div>
									<div class="col-md-3 mb-3">
										<label for="categoryID">Loại sản phẩm</label> <select
											class="form-control" id="categoryID" name="categoryID">
											<!-- Duyệt qua danh sách loại sản phẩm -->
											<%
											for (Category category : categoryList) {
											%>
											<!-- Tạo option cho dropdown -->
											<option value="<%=category.getCid()%>"><%=category.getCname()%></option>
											<%
											}
											%>
										</select>
									</div>
									<div class="col-md-3 mb-3">
										<label>&nbsp;</label><br> <input type="hidden"
											name="type" value="ADD" />
										<button type="submit" class="btn btn-primary">Thêm
											sản phẩm</button>
									</div>
								</div>
								<div id="notification" style="display: none;"></div>
							</form>
						</div>
						<!-- END DATA TABLE -->
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        $(document).ready(function() {
            // Áp dụng DataTables cho bảng của bạn
            $('.table-data2').DataTable({
                "paging": true,    // Kích hoạt tính năng phân trang
                "searching": true  // Kích hoạt tính năng tìm kiếm
                // Các tuỳ chọn khác tùy thuộc vào nhu cầu của bạn
            });
        });

        // Function to show success alert
        function showSuccessAlert() {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('type') === 'ADD' && urlParams.get('success') === 'true') {
                alert("Sản phẩm được thêm thành công");
            }
            if (urlParams.get('type') === 'DELETE' && urlParams.get('success') === 'true') {
                alert("Xóa sản phẩm thành công");
            }
            if (urlParams.get('type') === 'UPDATE' && urlParams.get('success') === 'true') {
                alert("Cập nhật sản phẩm thành công");
            }
        }

        // Function to check if a URL is valid
        function isValidURL(url) {
            try {
                new URL(url);
                return true;
            } catch (_) {
                return false;
            }
        }

        // Get form inputs
        var nameInput = document.getElementById('name');
        var priceInput = document.getElementById('price');
        var imageInput = document.getElementById('image');
        var categoryInput = document.getElementById('categoryID');

        // Name field custom validation
        nameInput.addEventListener('invalid', function() {
            this.setCustomValidity(nameInput.value.trim() === '' ? 'Vui lòng nhập tên sản phẩm' : '');
        });

        // Price field custom validation
        priceInput.addEventListener('invalid', function() {
            this.setCustomValidity(priceInput.value.trim() === '' ? 'Vui lòng nhập giá sản phẩm' : '');
        });

        // Image field custom validation
        imageInput.addEventListener('invalid', function() {
            if (imageInput.value.trim() === '') {
                this.setCustomValidity('Vui lòng thêm ảnh');
            } else if (!isValidURL(imageInput.value.trim())) {
                this.setCustomValidity('Địa chỉ ảnh URL không hợp lệ');
            } else {
                this.setCustomValidity('');
            }
        });

        // Category field custom validation
        categoryInput.addEventListener('invalid', function() {
            this.setCustomValidity(categoryInput.value.trim() === '' ? 'Vui lòng chọn loại sản phẩm' : '');
        });

        // Reset custom validity when user starts typing
        document.querySelectorAll('input[required], select[required]').forEach(function(input) {
            input.addEventListener('input', function() {
                this.setCustomValidity('');
            });
        });

        $(document).ready(function() {
            $('#searchInput').on('keyup', function() {
                var value = $(this).val();
                if (value.length > 2) {
                    $.ajax({
                        url: '/WebShop/Trangchu/OwnerShop/searchAjax',
                        type: 'GET',
                        data: { term: value },
                        success: function(data) {
                            renderTable(data);
                        },
                        error: function(xhr, status, error) {
                            console.error("An error occurred: " + error);
                        }
                    });
                } else {
                    // Khi không có dữ liệu tìm kiếm, lấy toàn bộ sản phẩm
                    loadFullProductList();
                }
            });

            function loadFullProductList() {
                $.ajax({
                    url: '/WebShop/Trangchu/OwnerShop/searchAjax', // Hoặc một URL khác lấy toàn bộ danh sách sản phẩm
                    type: 'GET',
                    data: { term: '' },
                    success: function(data) {
                        renderTable(data);
                    },
                    error: function(xhr, status, error) {
                        console.error("An error occurred while loading all products: " + error);
                    }
                });
            }

            function renderTable(products) {
                var tbody = $('.table-data2 tbody');
                tbody.empty();
                $.each(products, function(index, product) {
                    var editForm = $(
                        '<form method="GET" action="/WebShop/Trangchu/OwnerShop" onsubmit="return validateForm()">' +
                        '<input type="hidden" name="id" value="' + product.id + '" />' +
                        '<input type="hidden" name="action" value="edit" />' +
                        '<button type="submit" class="item" data-toggle="tooltip" data-placement="top" title="Edit">' +
                        '<i class="fa fa-wrench"></i>' +
                        '</button>' +
                        '</form>'
                    );

                    var deleteForm = $(
                        '<form method="post" action="/WebShop/Trangchu/OwnerShop" onsubmit="return validateForm()">' +
                        '<input type="hidden" name="type" value="DELETE" />' +
                        '<input type="hidden" name="pID" value="' + product.id + '" />' +
                        '<button class="item" data-toggle="tooltip" data-placement="top" title="Delete">' +
                        '<i class="fa fa-trash" aria-hidden="true"></i>' +
                        '</button>' +
                        '</form>'
                    );

                    var row = $(
                        '<tr class="tr-shadow">' +
                        '<td><label class="au-checkbox"><input type="checkbox"><span class="au-checkmark"></span></label></td>' +
                        '<td>' + product.id + '</td>' +
                        '<td><span class="block-email">' + product.name + '</span></td>' +
                        '<td class="desc">' + product.description + '</td>' +
                        '<td style="max-width: 200px"><img src="' + product.image + '" alt="Product Image" style="max-width: 100%; height: auto;"></td>' +
                        '<td>Category</td>' + // Placeholder cho Category
                        '<td>' + product.price + '</td>' +
                        '<td></td>' +
                        '</tr>'
                    );

                    var div = $('<div class="table-data-feature">').append(editForm).append(deleteForm);
                    row.find('td:last').append(div);
                    tbody.append(row);
                });
            }
        });

        // Call the function to show success alert
        showSuccessAlert();
    });
</script>




	<!-- Jquery JS-->
	<script src="vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script src="vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="vendor/slick/slick.min.js">
		
	</script>
	<script src="vendor/wow/wow.min.js"></script>
	<script src="vendor/animsition/animsition.min.js"></script>
	<script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script src="vendor/counter-up/jquery.waypoints.min.js"></script>
	<script src="vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script src="vendor/circle-progress/circle-progress.min.js"></script>
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script src="/webapp/style/assets/js/main.js"></script>
	<script type="text/javascript" src="/WebShop/style/assets/js/main.js"></script>

</body>

</html>
<!-- end document-->