<%@page import="model.entities.Client"%>
<%@page import="model.DAOs.ProductDAO"%>
<%@page import="config.ConnectionSQL"%>
<%@page import="model.entities.Cart"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NumberFormat vndFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
request.setAttribute("vndFormat", vndFormat);
Client auth = (Client) request.getSession().getAttribute("user");
if (auth != null) {
	request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
double total = 0;
if (cart_list != null) {
	ProductDAO pDao = new ProductDAO(ConnectionSQL.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
String previousPage = (String) session.getAttribute("previousPage");
if (previousPage == null) {
	previousPage = "Home.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/Pages/MasterPage/head.jsp"%>
<title>E-Commerce Cart</title>
<style>
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px; @media ( min-width : 1025px) { .h-custom {
	height: 100vh !important;
}
}
}
</style>
</head>
<body>

	<section class="h-100 h-custom" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card">
						<div class="card-body p-4">

							<div class="row">

								<div class="col-lg-7">
									<h5 class="mb-3">
										<a href="<%=previousPage%>" class="text-body"><i
											class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua sắm</a>
									</h5>
									<hr>

									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<div>
											<p class="mb-1">Giỏ hàng</p>
											<p class="mb-0">
												Bạn có
												<%=(cart_list != null) ? cart_list.size() : 0%>
												sản phẩm trong giỏ hàng
											</p>
										</div>
										<div>
											<p class="mb-0">
												<span class="text-muted">Sắp xếp theo:</span> <a href="#!"
													class="text-body">giá <i class="fas fa-angle-down mt-1"></i></a>
											</p>
										</div>
									</div>

									<%
									if (cart_list != null) {
										for (Cart c : cartProduct) {
									%>
									<div class="card mb-3">
										<div class="card-body">
											<div class="d-flex justify-content-between">
												<div class="d-flex flex-row align-items-center">
													<div>
														<img src="<%=c.getImage()%>" class="img-fluid rounded-3"
															alt="Shopping item" style="width: 65px;">
													</div>
													<div class="ms-3">
														<h5><%=c.getName()%></h5>
														<p class="small mb-0">
															Số lượng:
															<%=c.getQuantity()%></p>
													</div>
												</div>
												<div class="d-flex flex-row align-items-center">
													<div style="width: 80px;">
														<h5 class="mb-0"><%=vndFormat.format(c.getPrice())%></h5>
													</div>
													<a
														href="<%=request.getContextPath()%>/Trangchu/remove-from-cart?id=<%=c.getId()%>"
														style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
												</div>
											</div>
											<div
												class="d-flex justify-content-between align-items-center mt-2">
												<form
													action="<%=request.getContextPath()%>/Trangchu/order-now"
													method="post" class="form-inline">
													<input type="hidden" name="id" value="<%=c.getId()%>"
														class="form-input">
													<div class="form-group d-flex justify-content-between">
														<a class="btn btn-sm btn-incre"
															href="<%=request.getContextPath()%>/Trangchu/quantity-inc-dec?action=inc&id=<%=c.getId()%>">
															<i class="fas fa-plus-square"></i>
														</a> <input type="text" name="quantity" class="form-control"
															value="<%=c.getQuantity()%>" readonly> <a
															class="btn btn-sm btn-decre <%=(c.getQuantity() <= 1) ? "disabled" : ""%>"
															href="<%=request.getContextPath()%>/Trangchu/quantity-inc-dec?action=dec&id=<%=c.getId()%>">
															<i class="fas fa-minus-square"></i>
														</a>
													</div>
													<button type="submit" class="btn btn-primary btn-sm">Mua</button>
												</form>
											</div>
										</div>
									</div>
									<%
									}
									} else {
									%>
									<p>Giỏ hàng của bạn đang trống.</p>
									<%
									}
									%>

								</div>
								<div class="col-lg-5">
									<div class="card bg-primary text-white rounded-3">
										<div class="card-body">
							<form action="<%=request.getContextPath()%>/Trangchu/Payment" method="post">
    <div data-mdb-input-init class="form-outline form-white mb-4">
        <input type="text" id="fullName" name="fullName" class="form-control form-control-lg" size="17" placeholder="Họ và Tên" required />
        <label class="form-label" for="fullName">Họ và Tên</label>
    </div>
    <div data-mdb-input-init class="form-outline form-white mb-4">
        <input type="text" id="address" name="address" class="form-control form-control-lg" size="17" placeholder="Địa chỉ nhận hàng" required />
        <label class="form-label" for="address">Địa chỉ nhận hàng</label>
    </div>
    <div data-mdb-input-init class="form-outline form-white mb-4">
        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control form-control-lg" size="17" placeholder="Số điện thoại" minlength="10" maxlength="10" required />
        <label class="form-label" for="phoneNumber">Số điện thoại</label>
    </div>
    <div data-mdb-input-init class="form-outline form-white mb-4">
        <input type="text" id="birthdate" name="birthdate" class="form-control form-control-lg" size="17" placeholder="Ngày tháng năm sinh (DD/MM/YYYY)" minlength="10" maxlength="10" required />
        <label class="form-label" for="birthdate">Ngày tháng năm sinh</label>
    </div>
    <hr class="my-4">
  <div class="d-flex justify-content-between">
        <p class="mb-2">Tổng tiền</p>
        <p class="mb-2"><%=vndFormat.format(total)%></p>
        <input type="hidden" name="total" value="<%=total%>">
    </div>
    <button type="submit" class="btn btn-info btn-block btn-lg">
        <div class="d-flex justify-content-between">
            <span><%=vndFormat.format(total)%></span> <span>Thanh toán <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
        </div>
    </button>
</form>


										</div>
									</div>
								</div>


							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
