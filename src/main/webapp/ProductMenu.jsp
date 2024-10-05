<%@page import="model.DAOs.ProductDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Client"%>
<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat, java.util.Locale"%>
<%!
    // Định nghĩa một phương thức để định dạng tiền tệ
    public String formatCurrency(Object price) {
        // Kiểm tra nếu giá trị price là null
        if (price == null) {
            // Nếu price là null, trả về chuỗi "0"
            return "0";
        }
        // Chuyển đổi giá trị price thành kiểu double
        double amount = Double.parseDouble(price.toString());
        // Tạo một đối tượng NumberFormat để định dạng tiền tệ theo định dạng của Việt Nam
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        // Định dạng số tiền và trả về chuỗi đã định dạng
        return formatter.format(amount);
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>IPHONE - IPHONE Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->

<link
	href="<%=request.getContextPath()%>/style/assets/css/lightbox.min.css"
	rel="stylesheet" media="all">

<link
	href="<%=request.getContextPath()%>/style/assets/css/owl.carousel.min.css"
	rel="stylesheet" media="all">


<!-- Customized Bootstrap Stylesheet -->

<link
	href="<%=request.getContextPath()%>/style/assets/css/bootstrap2.min.css"
	rel="stylesheet" media="all">
<!-- Template Stylesheet -->

<link href="<%=request.getContextPath()%>/style/assets/css/style2.css"
	rel="stylesheet" media="all">

<style>
.bg-secondary {
	background-color: #d10024 !important;
}

.custom-flex-container {
	display: flex !important;
	flex-direction: column !important;
	align-items: flex-start !important;
}

.custom-btn {
	align-self: flex-end !important;
	margin-top: auto !important; /* Đẩy nút xuống dưới */
	margin-right: 0 !important;
}

.custom-price {
	margin-bottom: 0.5rem !important;
	/* Tạo khoảng cách bên dưới giá tiền, nếu cần */
}

.fruite-categorie li a {
    opacity: 1; /* Mặc định, tất cả các mục sẽ đậm */
}

.fruite-categorie li a.unselected-category {
    opacity: 0.2; /* Mục không được chọn sẽ mờ đi */
}



</style>
</head>


<body>
	<%@ include file="/Pages/MasterPage/Header.jsp"%>
	<%
	String categoryID = (String) session.getAttribute("categoryID");
	// Retrieve categoryID from session
	String sortOrder = (String) request.getAttribute("sortOrder");
	%>


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">ĐIỆN THOẠI CHÍNH HÃNG</h1>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">

							<div class="input-group w-100 mx-auto d-flex">
								<input type="search" class="form-control p-3 search-input"
									placeholder="Tìm kiếm" aria-label="Tìm kiếm"
									aria-describedby="search-icon-1" name="search"
									onkeydown="handleSearch(event)">
								<button type="button" class="input-group-text p-3 search-button"
									onclick="search()">
									<i class="fa fa-search"></i>
								</button>
							</div>


						</div>
						<div class="col-6"></div>
<div class="col-xl-3">
    <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
        <label for="fruits" style="color:black;">Xếp theo:</label>
        <select id="fruits" name="sortOrder" class="border-0 form-select-sm bg-light me-3" form="sortForm">
            <option value="bestseller" <%= "bestseller".equals(request.getParameter("sortOrder")) || request.getParameter("sortOrder") == null ? "selected" : "" %>>Bán chạy nhất</option>
            <option value="newest" <%= "newest".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Mới ra mắt</option>
            <option value="priceLowToHigh" <%= "priceLowToHigh".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Giá thấp đến cao</option>
            <option value="priceHighToLow" <%= "priceHighToLow".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Giá cao đến thấp</option>
        </select>
    </div>
</div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
						
						
						
							<div class="row g-4">
						    <!-- FILTER SECTION START-->
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4>Danh mục</h4>
                                        <ul class="list-unstyled fruite-categorie">
                                            <%
                                            String selectedCategory = request.getParameter("search");
                                            if (categoryID == null) {
                                                categoryID = (String) session.getAttribute("categoryID");
                                            } 
                                            if ("1".equals(categoryID)) { // Category ID for iPhone
                                            %>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=1&search=iPhone 15" class="<%= ("iPhone 15".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-apple-alt me-2"></i>IPHONE 15</a> <span>(3)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=1&search=iPhone 14" class="<%= ("iPhone 14".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-apple-alt me-2"></i>IPHONE 14</a> <span>(5)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=1&search=iPhone 13" class="<%= ("iPhone 13".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-apple-alt me-2"></i>IPHONE 13</a> <span>(2)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=1&search=iPhone 12" class="<%= ("iPhone 12".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-apple-alt me-2"></i>IPHONE 12</a> <span>(8)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=1&search=Old iPhone" class="<%= ("Old iPhone".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-apple-alt me-2"></i>IPHONE CŨ</a> <span>(5)</span>
                                                </div>
                                            </li>
                                            <% 
                                            } else if ("2".equals(categoryID)) { // Category ID for Samsung
                                            %>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=2&search=Samsung Galaxy S21" class="<%= ("Samsung Galaxy S21".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-mobile-alt me-2"></i>Samsung Galaxy S21</a> <span>(4)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=2&search=Samsung Galaxy S20" class="<%= ("Samsung Galaxy S20".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-mobile-alt me-2"></i>Samsung Galaxy S20</a> <span>(6)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=2&search=Samsung Galaxy S10" class="<%= ("Samsung Galaxy S10".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-mobile-alt me-2"></i>Samsung Galaxy S10</a> <span>(3)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=2&search=Samsung Galaxy Note 20" class="<%= ("Samsung Galaxy Note 20".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-mobile-alt me-2"></i>Samsung Galaxy Note 20</a> <span>(2)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="<%=request.getContextPath()%>/Trangchu/ProductMenu?categoryID=2&search=Old Samsung" class="<%= ("Old Samsung".equals(selectedCategory)) ? "selected-category" : (selectedCategory != null ? "unselected-category" : "") %>"><i class="fas fa-mobile-alt me-2"></i>Samsung Cũ</a> <span>(5)</span>
                                                </div>
                                            </li>
                                            <% 
                                            } 
                                            %>
                                        </ul>
                                    </div>
                                </div>

                                <form id="filterForm" action="<%=request.getContextPath()%>/Trangchu/ProductMenu" method="GET">
                                    <input type="hidden" name="categoryID" value="<%= categoryID %>">
                                    <input type="hidden" name="search" value="<%= request.getParameter("search") %>">
                                    
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Giá</h4>
                                            <input type="range" class="form-range w-100" id="price" name="price" min="0" max="100000000" value="<%= request.getParameter("price") != null ? request.getParameter("price") : "0" %>" oninput="updatePriceValue()">
                                            <output id="amount" for="price"><%= request.getParameter("price") != null ? request.getParameter("price") : "0" %> VND</output>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <h4>Bộ nhớ trong</h4>
                                        <div class="mb-2">
                                            <input type="radio" class="me-2" id="memory_512plus" name="memory" value="512+" <%="512+".equals(request.getParameter("memory")) ? "checked" : ""%>> <label for="memory_512plus"> Trên 512GB</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="radio" class="me-2" id="memory_128_256" name="memory" value="128-256" <%="128-256".equals(request.getParameter("memory")) ? "checked" : ""%>> <label for="memory_128_256"> 128GB và 256GB</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="radio" class="me-2" id="memory_32_64" name="memory" value="32-64" <%="32-64".equals(request.getParameter("memory")) ? "checked" : ""%>> <label for="memory_32_64"> 32GB và 64GB</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Kích thước màn hình</h4>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="screenSize_6plus" name="screenSize" value="6+" <%="6+".equals(request.getParameter("screenSize")) ? "checked" : ""%>> <label for="screenSize_6plus"> Trên 6 inch</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="screenSize_6minus" name="screenSize" value="-6" <%="-6".equals(request.getParameter("screenSize")) ? "checked" : ""%>> <label for="screenSize_6minus"> Dưới 6 inch</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Kiểu màn hình</h4>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="screenType_DynamicIsland" name="screenType" value="Dynamic Island" <%="Dynamic Island".equals(request.getParameter("screenType")) ? "checked" : ""%>> <label for="screenType_DynamicIsland"> Dynamic Island</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="screenType_Notch" name="screenType" value="Notch" <%="Notch".equals(request.getParameter("screenType")) ? "checked" : ""%>> <label for="screenType_Notch"> Tai thỏ</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <button type="submit" style="background-color: #d10024 ; color: white; padding: 10px 20px; border: none; cursor: pointer; border-radius: 4px;">Xem kết quả</button>
                                </form>
                                <!-- FILTER SECTION END-->
       
       
								<div class="col-lg-12">
    <h4 class="mb-3">Có thể bạn quan tâm</h4>
    
    <% 
    ArrayList<Product> productList2 = ProductDAO.findRandomByCategoryId(6, 3);
        if (productList2 != null) {
            for (Product product : productList2) {
    %>
    <div class="d-flex align-items-center justify-content-start">
        <div class="rounded me-4" style="width: 100px; height: 100px;">
            <img src="<%= product.getImage() %>" class="img-fluid rounded" alt="">
        </div>
        <div>
            <h6 class="mb-2"><%= product.getName() %></h6>
            <div class="d-flex mb-2">
                <i class="fa fa-star text-secondary"></i> 
                <i class="fa fa-star text-secondary"></i> 
                <i class="fa fa-star text-secondary"></i> 
                <i class="fa fa-star text-secondary"></i> 
                <i class="fa fa-star"></i>
            </div>
            <div class="d-flex mb-2">
                <h5 class="fw-bold me-2"><%= formatCurrency(product.getPrice()) %> </h5>
                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
            </div>
        </div>
    </div>
    <% 
            }
        } else {
            out.println("<p>Không có sản phẩm nào để hiển thị.</p>");
        }
    %>
    <div class="d-flex justify-content-center my-4">
        <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">View More</a>
    </div>
</div>


								<div class="col-lg-12">
									<div class="position-relative">
										<img src="https://images.fonearena.com/blog/wp-content/uploads/2022/12/OnePlus-Cloud-11-launch-event-1-886x1024.jpg"
											class="img-fluid w-100 rounded" alt="">
										<div class="position-absolute"
											style="top: 50%; right: 10px; transform: translateY(-50%);">
											<h3 class="text-secondary fw-bold">
												
											</h3>
										</div>
									</div>
								</div>
							</div>
								
							
						</div>
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<%-- Đảm bảo đã lấy danh sách sản phẩm từ attribute --%>
								<%
								
								List<Product> productList = (List<Product>) request.getAttribute("productList");
								List<Product> bestSellingProducts = (List<Product>) request.getAttribute("bestSellingProducts");
							
								if (productList != null && productList.size() > 0) {
									for (Product product : productList) {
										boolean isBestSeller = false;
										if (bestSellingProducts != null) {
									for (Product bestProduct : bestSellingProducts) {
										if (product.getId() == bestProduct.getId()) {
											isBestSeller = true;
											break;
										}
									}
										}
								%>
								<div class="col-md-6 col-lg-6 col-xl-4">
									<div class="rounded position-relative fruite-item">
										<div class="fruite-img">
											<%-- Kiểm tra và hiển thị hình ảnh sản phẩm, sử dụng hình mặc định nếu không có hình --%>
											<a
												href="<%=request.getContextPath()%>/Trangchu/Product?id=<%=product.getId()%>">
												<img
												src="<%=product.getImage() != null ? product.getImage() : "path/to/default/image.jpg"%>"
												class="img-fluid w-100 rounded-top"
												alt="<%=product.getName()%>">
											</a>
										</div>
										<%-- Chỉ hiển thị tag "Bán chạy nhất" nếu sản phẩm là best seller --%>
										<%
										if (isBestSeller) {
										%>
										<div
											class="text-white bg-secondary px-3 py-1 rounded position-absolute"
											style="top: 10px; left: 10px;">Bán chạy nhất</div>
										<%
										}
										%>
										<div
											class="p-4 border border-secondary border-top-0 rounded-bottom">
											<h4><%=product.getName()%></h4>
											<p>Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng
												kỳ hạn 3-6 tháng</p>
											<div class="custom-flex-container">
												<%
												NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
												String formattedPrice = currencyFormat.format(product.getPrice());
												%>
												<p class="custom-price text-dark fs-5 fw-bold mb-0"><%=formattedPrice%></p>
												<a href="#"
													class="custom-btn btn border border-secondary rounded-pill px-3 text-primary mt-2"
													onclick="addToCartFromProductMenu('<%=product.getId()%>')">
													<i class="fa fa-shopping-bag me-2 text-primary"></i> Mua
													ngay
												</a>
											</div>

										</div>
									</div>
								</div>
								<%
								}
								} else {
								%>
								<div class="col-12">
									<p>No products found in this category.</p>
								</div>
								<%
								}
								%>
							</div>
						</div>



						<div class="col-12">
							<div class="pagination d-flex justify-content-center mt-5">
								<a href="#" class="rounded">&laquo;</a> <a href="#"
									class="active rounded">1</a> <a href="#" class="rounded">2</a>
								<a href="#" class="rounded">3</a> <a href="#" class="rounded">4</a>
								<a href="#" class="rounded">5</a> <a href="#" class="rounded">6</a>
								<a href="#" class="rounded">&raquo;</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- Fruits Shop End-->







	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script type="text/javascript" src="/WebShop/style/assets/js/main.js"></script>
<script>
    function addToCartFromProductMenu(productId) {
        // Thực hiện hành động thêm sản phẩm vào giỏ hàng ở đây
        // Ví dụ: chuyển hướng đến servlet và gửi yêu cầu thêm sản phẩm vào giỏ hàng từ trang ProductMenu.jsp
        window.location.href = '${pageContext.request.contextPath}/add-to-cart?action=addFromProductMenu&id=' + productId;
		}
    
    
    function search() {
        var searchTerm = document.querySelector('.search-input').value;
        if (searchTerm.trim() !== '') {
            // Thực hiện chuyển hướng tới trang tìm kiếm với tham số search
            window.location.href = '<%=request.getContextPath()%>/Trangchu/ProductMenu?search=' + encodeURIComponent(searchTerm);
        }
    }

    function handleSearch(event) {
        if (event.key === 'Enter') {
            search();
        }
    }
    document.getElementById('fruits').addEventListener('change', function() {
        var sortOrder = this.value;
        var cateID = '<%= session.getAttribute("categoryID") %>';
        cateID = cateID.trim();
        window.location.href = '<%=request.getContextPath()%>/Trangchu/ProductMenu?sortOrder=' + sortOrder + '&categoryID=' + cateID;
    });
    
    function updatePriceValue() {
        var range = document.getElementById("price");
        var output = document.getElementById("amount");
        output.innerHTML = formatCurrency(range.value) + " VND";	
    }
    
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
    }
	</script>

</body>

</html>