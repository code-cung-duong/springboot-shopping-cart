<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Shopping Cart</title>
	<%@include file="/common/web/css.jsp"%>
</head>

<body>

	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!--================ Start Header Menu Area =================-->
	<%@include file="/common/web/header.jsp"%>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shopping
								Cart</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Cart Area =================-->

	<c:if test="${empty carts.listResult}">
		<h5 align='center' style='margin: 69px 0 130px 0;'>Your shopping
			cart is empty</h5>
		<%@include file="/common/web/top_product.jsp"%>
	</c:if>
	<c:if test="${not empty carts.listResult}">
		<section class="cart_area">
			<div class="container">
				<div class="cart_inner">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Product</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total</th>
								</tr>
							</thead>
							<tbody>
								<form id="formData" autocomplete="off">

									<c:forEach var="item" items="${carts.listResult}">

										<tr>
											<td>
												<div class="media">
													<div class="d-flex">
														<img width="100px" height="100px"
															src="web/img/product/${item.image}" alt="">
													</div>
													<div class="media-body">
														<p>${item.name}</p>
													</div>
												</div>
											</td>
											<td>
												<h5>$<span id="price_${item.id}">${item.price}</span></h5>
											</td>
											<td>
												<div class="product_count">
													<input type="hidden" name="id" value="${item.id}" />
													<input type="hidden" name="price" value="${item.price}" />
													<input onchange="dangky(${item.id});" type="text" name="qty"
														id="sst_${item.id}" maxlength="12" value="${item.amount}"
														title="Quantity:" class="input-text qty">

													<button
														onclick="var result = document.getElementById('sst_${item.id}'); var sst = result.value; if( !isNaN( sst )) result.value++;dangky(${item.id});sum();return false;"
														class="increase items-count" type="button"><i
															class="lnr lnr-chevron-up"></i></button>
													<button
														onclick="var result = document.getElementById('sst_${item.id}'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;dangky(${item.id});sum();return false;"
														class="reduced items-count" type="button"><i
															class="lnr lnr-chevron-down"></i></button>
												</div>
											</td>
											<td>
												<h5 id="tinhTien_${item.id}">$${item.amount * item.price}</h5>
											</td>
											<td>

												<a href="#formData" onclick="warningBeforeDelete(${item.id})"><i
														class="fa fa-trash-o" aria-hidden="true"></i></a>

											</td>
										</tr>


									</c:forEach>
								</form>



								<tr class="bottom_button">
									<td><a href="#formData" onclick="updateCart()" class="button button-header">Update Cart</a></td>
									<td></td>
									<td></td>
									<td>
										<div class="cupon_text d-flex align-items-center">
											<input type="text" placeholder="Coupon Code"> <a class="primary-btn"
												href="#">Apply</a>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
										<h5>Subtotal</h5>
									</td>
									<td>
										<h5 id="total">$2160.00</h5>
									</td>
								</tr>
								<tr class="shipping_area">
									<td class="d-none d-md-block"></td>
									<td></td>
									<td>
										<h5>Shipping</h5>
									</td>
									<td>
										<div class="shipping_box">
											<ul class="list">
												<li><a href="#">Flat Rate: $5.00</a></li>
												<li><a href="#">Free Shipping</a></li>
												<li><a href="#">Flat Rate: $10.00</a></li>
												<li class="active"><a href="#">Local Delivery:
														$2.00</a></li>
											</ul>
											<h6>
												Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i>
											</h6>
											<select class="shipping_select">
												<option value="1">Bangladesh</option>
												<option value="2">India</option>
												<option value="4">Pakistan</option>
											</select> <select class="shipping_select">
												<option value="1">Select a State</option>
												<option value="2">Select a State</option>
												<option value="4">Select a State</option>
											</select> <input type="text" placeholder="Postcode/Zipcode"> <a
												class="gray_btn" href="#">Update Details</a>
										</div>
									</td>
								</tr>
								<tr class="out_button_area">
									<td class="d-none-l"></td>
									<td class=""></td>
									<td></td>
									<td>
										<div class="checkout_btn_inner d-flex align-items-center">
											<a class="gray_btn" href="/shop">Continue Shopping</a> <a onclick="updateCart()"
												class="primary-btn ml-2" href="/checkout" >Checkout</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</c:if>

	<!--================End Cart Area =================-->

	<!--================ Start footer Area  =================-->
	<%@include file="/common/web/footer.jsp"%>
	<!--================ End footer Area  =================-->


	<c:url var="APIurl" value="/api/cart" />
	<c:url var="NewURL" value="/cart" />


	<%@include file="/common/web/js.jsp"%>
	<script>
		function dangky(index) {
			var sl = parseInt($('#sst_' + index).val());
			var price = parseInt($('#price_' + index).html());
			$('#tinhTien_' + index).html('$' + parseInt(sl * price));
			sum();
		}
		sum();

		function sum() {
			var data = [];
			var formData = $('#formData').serializeArray();
			$.each(formData, function (i, v) {
				data[i] = parseInt(v.value);
			});
			var tong = 0;
			for (var i = 0; i < data.length; i++) {
				if (i % 3 == 0) {
					tong += data[i + 1] * data[i + 2];
				}
			}
			$('#total').html('$' + tong);
		}

		function warningBeforeDelete(index) {
			var data = [];
			data[0] = index + "";
			deleteNew(data);
		}

		function deleteNew(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					swal({
						title: "Successful!",
						text: "Delete product successful",
						icon: "success",
						button: false,
					});
					setTimeout(() => {
						window.location.href = "${NewURL}";
					}, 1200);
				},
				error: function (error) {

				}
			});
		}

		function updateCart() {
			var data = [];

			var lists = [];
			var formData = $('#formData').serializeArray();
			$.each(formData, function (i, v) {
				data[i] = v.value;
			});
			var d = 0;
			for (var i = 0; i < data.length; i++) {
				if (i % 3 == 0) {
					var list = {};
					list['id'] = data[i];
					list['amount'] = data[i + 2];
					lists[d] = list;
					d++;
				}
			}

			lists.forEach(element => {
				edit(element);
			});

			function edit(data) {
				$.ajax({
					url: '${APIurl}',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function (result) {
						swal({
						title: "Successful!",
						text: "Update shopping cart successful",
						icon: "success",
						button: false,
					});
					setTimeout(() => {
						window.location.href = "${NewURL}";
					}, 1000);
					},
					error: function (error) {}
				});
			}
		}
	</script>
	<script>
		$('#dangky').onload(function (e){

		})
	</script>

</body>

</html>