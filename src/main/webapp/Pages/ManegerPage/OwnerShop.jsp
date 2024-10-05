<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Client"%>
<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SHOP MALL</title>
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
<script type="text/javascript">
    $(document).ready(function() {
        $('select').selectize({
            sortField : 'text'
        });
    });
</script>
<style>
body {
	min-height: 100vh;
	background-color: #FFE53B;
	background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 100%);
}

@media ( min-width : 1200px) .container {
	max-width
	:
	 
	100
	%;
	

}
</style>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Arimo:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap')
	;

* {
	margin: 0;
	box-sizing: border-box;
}

#contact {
	color: #fff;
	width: 100%;
	height: 100%;
	position: fixed;
	background-color: rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: center;
	align-items: center;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.contact-box {
	width: 80%; /* Sửa chiều rộng của contact-box thành 80% */
	margin: 80px auto; /* Canh giữa contact-box theo chiều ngang và đặt margin top và bottom là 80px */
	display: flex;
	flex-wrap: wrap;
}
.btn-close {
    position: absolute;
    top: 10px; /* Điều chỉnh vị trí theo y */
    right: 10px; /* Điều chỉnh vị trí theo x */
    background: none;
    border: none;
    cursor: pointer;
}

.contact-links, .contact-form-wrapper {
	width: 50%;
	padding: 8% 5% 10% 5%;
}

.contact-links {
	padding: 0 !important;
}

.contact-form-wrapper {
	position: relative;
	background-color: #FF4B2B;
	border-radius: 10px;
	padding: 30px;
	width: 80%; /* Điều chỉnh độ rộng của form */
	max-width: 600px; /* Điều chỉnh độ rộng tối đa của form */
}

@media only screen and (max-width: 800px) {
	.contact-links, .contact-form-wrapper {
		width: 100%;
	}
	.contact-links {
		border-radius: 10px 10px 0 0;
	}
	.contact-form-wrapper {
		border-radius: 0 0 10px 10px;
		width: 90%; /* Điều chỉnh độ rộng của form khi màn hình nhỏ hơn */
	}
}

@media only screen and (max-width: 400px) {
	.contact-box {
		width: 95%;
		margin: 8% 5%;
	}
}

h2 {
	font-family: 'Arimo', sans-serif;
	color: #fff;
	font-size: clamp(30px, 6vw, 60px);
	letter-spacing: 2px;
	text-align: center;
	transform: scale(.95, 1);
}

.links {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding-top: 50px;
}

.link {
	margin: 10px;
	cursor: pointer;
}

img {
	width: 100%;
	height: 100%;
	transition: 0.2s;
	user-select: none;
}

img:hover {
	transform: scale(1.1, 1.1);
}

img:active {
	transform: scale(1.1, 1.1);
	filter: hue-rotate(220deg) drop-shadow(2px 4px 4px #222) sepia(0.3);
}

.form-item {
	position: relative;
}

.form-item>input {
	width: 100%;
	outline: 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 20px;
	padding: 12px;
	font-size: clamp(15px, 1.5vw, 18px);
}

label, input, textarea {
	font-family: 'Poppins', sans-serif;
}

textarea {
	width: 100%;
	outline: 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 20px;
	padding: 12px;
	font-size: clamp(15px, 1.5vw, 18px);
}

input:focus+label, input:valid+label, textarea:focus+label, textarea:valid+label
	{
	font-size: clamp(13px, 1.3vw, 16px);
	color: #777;
	top: -20px;
	transition: all .225s ease;
}

.submit-btn {
	filter: drop-shadow(2px 2px 3px #0003);
	color: #FF4B2B;
	font-family: "Poppins", sans-serif;
	font-size: clamp(16px, 1.6vw, 18px);
	display: block;
	padding: 12px 20px;
	margin: 2px auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	user-select: none;
	transition: 0.2s;
}

.submit-btn:hover {
	transform: scale(1.1, 1.1);
}

.submit-btn:active {
	transform: scale(1.1, 1.1);
	filter: sepia(0.5);
}

@media only screen and (max-width: 800px) {
	h2 {
		font-size: clamp(40px, 10vw, 60px);
	}
}

@media only screen and (max-width: 400px) {
	h2 {
		font-size: clamp(30px, 12vw, 60px);
	}
	.links {
		padding-top: 30px;
	}
	img {
		width: 38px;
		height: 38px;
	}
}

.close {
	display: none !important;
}

</style>


</head>
<body>
    <!-- Phần Header của trang web -->
    <div>
        <span style="font-size: 40px"><i class="fa fa-registered"
                aria-hidden="true"></i></span>
        <!-- Nút đăng xuất -->
        <button style="width: 100px; height: 40px">
            <a href="<%=request.getContextPath()%>/Trangchu/SignUpIn">Đăng
                Xuất</a>
        </button>
    </div>
    <!-- Phần chứa nội dung trang web -->
    <div class="container py-5" style="max-width: 100%;">
        <!-- Phần tiêu đề -->
        <header class="text-center text-white">
            <h1 class="display-4">Product Data Table</h1>
        </header>
        <div class="row py-5">
            <div class="col-lg-10 mx-auto">
                <div class="card rounded shadow border-0">
                    <div></div>
                    <div class="card-body p-5 bg-white rounded">
                        <div class="table-responsive">
                            <!-- Bảng hiển thị thông tin sản phẩm -->
                            <table id="example" style="width: 100%"
                                class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <!-- Các cột thông tin sản phẩm -->
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá gốc</th>
                                        <th>URL ảnh</th>
                                        <th>Loại sản phẩm</th>
                                        <th>Mô tả</th>
                                        <th>Chức năng</th>
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
                                    <tr>
                                        <!-- Thông tin của từng sản phẩm -->
                                        <td><%=product.getId()%></td>
                                        <td><%=product.getName()%></td>
                                        <td><%=product.getPrice()%></td>
                                        <td style="max-width: 200px"><%=product.getImage()%></td>
                                        <!-- Gọi phương thức để lấy loại sản phẩm từ ID -->
                                        <td id="<%=product.getCateID()%>"><%=CategoryBO.getCategory(product.getCateID())%></td>
                                        <td><%=product.getDescription()%></td>
                                        <!-- Các chức năng -->	
                                        <td style="min-width: 80px">
                                            <!-- Nút cập nhật -->
                                            <button class="btn-update"
                                                style="background-color: #007bff; border-radius: 8%; color: antiquewhite;">
                                                <i class="fa fa-wrench" aria-hidden="true"></i>
                                            </button>
                                            
                                            
                                            <!-- Form xóa sản phẩm -->
                                            <form method="post" action="<%=request.getContextPath()%>/Trangchu/OwnerShop">
                                                <input type="hidden" name="type" value="DELETE" />
                                                <input type="hidden" name="pID" value="<%=product.getId()%>" />
                                                <button style="background-color: #E34724; border-radius: 8%; color: antiquewhite;">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <!-- Form thêm sản phẩm mới -->
                            <form method="post" action="<%=request.getContextPath()%>/Trangchu/OwnerShop">
                                <div class="form-row">
                                    <div class="col-md-3 mb-3">
                                        <label for="name">Tên sản phẩm</label>
                                        <input type="text" class="form-control" id="name" name="name" autocomplete="off" required />
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="price">Giá gốc</label>
                                        <input type="text" class="form-control" id="price" name="price" autocomplete="off" required />
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="image">URL ảnh</label>
                                        <input type="text" class="form-control" id="image" name="image" autocomplete="off" />
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="description">Mô tả</label>
                                        <input type="text" class="form-control" id="description" name="description" autocomplete="off" />
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="categoryID">Loại sản phẩm</label>
                                        <select class="form-control" id="categoryID" name="categoryID">
                                            <!-- Duyệt qua danh sách loại sản phẩm -->
                                            <% for (Category category : categoryList) { %>
                                            <!-- Tạo option cho dropdown -->
                                            <option value="<%=category.getCid()%>"><%=category.getCname()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label>&nbsp;</label><br>
                                        <input type="hidden" name="type" value="ADD" />
                                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Script để khởi tạo DataTables -->
    
   
<!-- Form cập nhật sản phẩm -->
<div id="contact" class="close">
    <div class="contact-box">
        <button class="btn-close"><i class="fa fa-times" aria-hidden="true"></i></button>
        <div class="contact-form-wrapper">
            <form method="post" action="<%=request.getContextPath()%>/Trangchu/UpdateProduct">
                <h2>Update Product</h2>
                <div class="form-item">
                    <label for="update-id">ID</label>
                    <input type="text" id="update-id" name="update-id" readonly>
                </div>
                <div class="form-item">
                    <label for="update-name">Tên sản phẩm</label>
                    <input type="text" id="update-name" name="update-name">
                </div>
                <div class="form-item">
                    <label for="update-price">Giá sản phẩm</label>
                    <input type="text" id="update-price" name="update-price">
                </div>
                <div class="form-item">
                    <label for="update-image">URL ảnh</label>
                    <input type="text" id="update-image" name="update-image">
                </div>
                <div class="form-item">
                    <label for="update-category">Loại sản phẩm</label>
                    <select id="update-category" name="update-category" class="form-control">
                        <!-- Option cho loại sản phẩm sẽ được thêm bằng mã JavaScript hoặc từ dữ liệu từ máy chủ -->
                    </select>
                </div>
                <div class="form-item">
                    <label for="update-description">Mô tả</label>
                    <textarea id="update-description" name="update-description"></textarea>
                </div>
                <div class="form-item">
                    <button type="submit" class="submit-btn">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    $(function() {
        $('#example .btn-update').click(function(e) {
            e.preventDefault();
            // Lấy dữ liệu từ hàng trong bảng và điền vào các trường input tương ứng trong form cập nhật
            var row = $(this).closest('tr');
            $('#update-id').val(row.find('td:nth-child(1)').text());
            $('#update-name').val(row.find('td:nth-child(2)').text());
            $('#update-price').val(row.find('td:nth-child(3)').text());
            $('#update-image').val(row.find('td:nth-child(4)').text());
            $('#update-category').val(row.find('td:nth-child(5)').text());
            $('#update-description').val(row.find('td:nth-child(6)').text());
            // Mở form cập nhật sản phẩm
            $('#contact').removeClass('close');
        });

        $('.btn-close').click(function(e) {
            // Đóng form cập nhật sản phẩm
            $('#contact').addClass('close');
        });

        $(document).ready(function() {
            // Khởi tạo DataTables
            $('#example').DataTable();
        });
    });
</script>

    
</body>
</html>

