<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Check out</title>
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
					<h1>Product Checkout</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Checkout</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Checkout Area =================-->
	<section class="checkout_area section-margin--small">
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>Billing Details</h3>
						<form class="row contact_form" action="#" method="post"
							novalidate="novalidate">
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="first" name="name">
								<span class="placeholder" data-placeholder="First name"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="last" name="name">
								<span class="placeholder" data-placeholder="Last name"></span>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="company"
									name="company" placeholder="Company name">
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="number"
									name="number"> <span class="placeholder"
									data-placeholder="Phone number"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="email"
									name="compemailany"> <span class="placeholder"
									data-placeholder="Email Address"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<select class="country_select">
									<option value="1">Country</option>
									<option value="2">Country</option>
									<option value="4">Country</option>
								</select>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="add1" name="add1">
								<span class="placeholder" data-placeholder="Address line 01"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="add2" name="add2">
								<span class="placeholder" data-placeholder="Address line 02"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="city" name="city">
								<span class="placeholder" data-placeholder="Town/City"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<select class="country_select">
									<option value="1">District</option>
									<option value="2">District</option>
									<option value="4">District</option>
								</select>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="zip" name="zip"
									placeholder="Postcode/ZIP">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Create an account?</label>
								</div>
							</div>
							<div class="col-md-12 form-group mb-0">
								<div class="creat_account">
									<h3>Shipping Details</h3>
									<input type="checkbox" id="f-option3" name="selector">
									<label for="f-option3">Ship to a different address?</label>
								</div>
								<textarea class="form-control" name="message" id="message"
									rows="1" placeholder="Order Notes"></textarea>
							</div>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list">
								<li><a href="#">
										<h4>
											Product <span>Total</span>
										</h4>
								</a></li>
								<form id="formData">
									<c:forEach var="item" items="${carts.listResult}">
										<li><a href="#">${item.name} <span class="middle">x
													${item.amount}</span> <span id="sum_${item.id}" class="last">$${item.amount
													* item.price}</span></a></li>
											<input type="hidden" name="one" value="${item.amount
												* item.price}"/>
									</c:forEach>
								</form>
								
								


							</ul>
							<ul class="list list_2">
								<li><a href="#">Subtotal <span id="total1">$2160.00</span></a></li>
								<li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
								<li><a href="#">Total <span id="total2">$2210.00</span></a></li>
							</ul>
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="selector"> <label
										for="f-option5">Check payments</label>
									<div class="check"></div>
								</div>
								<p>Please send a check to Store Name, Store Street, Store
									Town, Store State / County, Store Postcode.</p>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="selector"> <label
										for="f-option6">Paypal </label> <img
										src="img/product/card.jpg" alt="">
									<div class="check"></div>
								</div>
								<p>Pay via PayPal; you can pay with your credit card if you
									don’t have a PayPal account.</p>
							</div>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" name="selector"> <label
									for="f-option4">I’ve read and accept the </label> <a href="#">terms
									& conditions*</a>
							</div>
							<div class="text-center">
								<a class="button button-paypal" href="#">Proceed to Paypal</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->


	<!--================ Start footer Area  =================-->
	<%@include file="/common/web/footer.jsp"%>
	<!--================ End footer Area  =================-->



	<%@include file="/common/web/js.jsp"%>

	<script>
		$(window).on('load', function(){
			var data = [];
			var formData = $('#formData').serializeArray();
			var tong = 0;
			$.each(formData, function (i, v) {
				data[i] = parseInt(v.value);
				tong+=data[i];
			});
			
			$('#total1').html('$' + tong);
			$('#total2').html('$' + parseInt(parseInt(tong)+50));
		});
	</script>

</body>

</html>