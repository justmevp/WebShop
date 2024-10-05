<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Client"%>
<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("listCC");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/manager.css" rel="stylesheet" type="text/css" />
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
</head>
<body>
	<div class="container">
		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form
						action="<%=request.getContextPath()%>/Trangchu/OwnerShop?action=update"
						method="post" onsubmit="return validateForm()">
						<div class="modal-header">
							<h4 class="modal-title">Edit Product</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>ID</label> <input value="${detail.id}" name="id"
									type="text" class="form-control" readonly required>
							</div>
							<div class="form-group">
								<label>Name</label> <input value="${detail.name}" name="name"
									type="text" class="form-control" required maxlength="100">
							</div>
							<div class="form-group">
								<label>Image</label> <input value="${detail.image}" name="image"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Price</label> <input value="${detail.price}" name="price"
									type="number" class="form-control" required min="0" step="any">
							</div>
							<div class="form-group">
								<label>Description</label>
								<textarea name="description" class="form-control" required
									maxlength="500">${detail.description}</textarea>
							</div>
							<div class="form-group">
								<label>Category</label> <select name="categoryID"
									class="form-select" aria-label="Default select example">
									<%
									for (Category category : categoryList) {
									%>
									<option value="<%=category.getCid()%>"><%=category.getCname()%></option>
									<%
									}
									%>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<input type="hidden" name="type" value="UPDATE"> <input
								type="submit" class="btn btn-success" value="Edit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/manager.js" type="text/javascript"></script>
	<script type="text/javascript">
		function validateForm() {
			const name = document.querySelector('input[name="name"]').value;
			const price = document.querySelector('input[name="price"]').value;
			const description = document
					.querySelector('textarea[name="description"]').value;
			const image = document.querySelector('input[name="image"]').value;

			// Regular expression to validate URL
			const urlPattern = /^(https?:\/\/[^ "]+$)/i;
			if (name.length > 80) {
				alert('Tên sản phẩm không vượt quá 80 kí tự');
				return false;
			}

			if (price < 0) {
				alert('Giá sản phẩm không thể là số âm');
				return false;
			}

			if (description.length == 0 || description.length > 500) {
				alert('Mô tả không nhiều hơn 500 kí tự');
				return false;
			}

			if (!urlPattern.test(image)) {
				alert('Địa chỉ ảnh không hợp lệ');
				return false;
			}

			return true;
		}

		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const priceInput = document
									.querySelector('input[name="price"]');
							priceInput
									.addEventListener(
											'input',
											function() {
												if (priceInput.validity.rangeUnderflow) {
													priceInput
															.setCustomValidity('Giá sản phẩm không thể là số âm');
												} else {
													priceInput
															.setCustomValidity('');
												}
											});
							
							const descriptionInput = document
									.querySelector('textarea[name="description"]');
							descriptionInput
									.addEventListener(
											'invalid',
											function(event) {
												if (descriptionInput.validity.valueMissing) {
													descriptionInput
															.setCustomValidity('Vui lòng điền vào trường này.');
												} else {
													descriptionInput
															.setCustomValidity('');
												}
											});
						});
	</script>
</body>
</html>
