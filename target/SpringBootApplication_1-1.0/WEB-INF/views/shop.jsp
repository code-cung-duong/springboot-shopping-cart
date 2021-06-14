<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@page import="com.util.SecurityUtils"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Aroma Shop</title>
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
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop
								Category</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Browse Categories</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form id="categoryCK">
									<ul>
										<c:forEach var="item" items="${categories.listResult}">
											<li class="filter-list"><input class="pixel-radio" type="radio"
													id="${item.code}" name="radioCa" value="${item.code}"><label
													for="${item.code}">${item.name}<span>(${item.totalItem})</span></label>
											</li>
										</c:forEach>


									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">Product Filters</div>
						<div class="common-filter">
							<div class="head">Brands</div>
							<form action="#">
								<ul>

									<c:forEach var="item" items="${brands.listBrand}">
										<li class="filter-list"><input class="pixel-radio" type="radio" id="${item.id}"
												name="brand"><label
												for="${item.id}">${item.brand}<span>(${item.totalBrand})</span></label>
										</li>
									</c:forEach>


								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">Color</div>
							<form action="#">
								<ul>
									<c:forEach var="item" items="${brands.listColor}">
										<li class="filter-list"><input class="pixel-radio" type="radio"
												id="color_${item.id}" name="color"><label
												for="color_${item.id}">${item.color}<span>(${item.totalColor})</span></label>
										</li>
									</c:forEach>



								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">Price</div>
							<div class="price-range-area">
								<div id="price-range"></div>
								<div class="value-wrapper d-flex">
									<div class="price">Price:</div>
									<span>$</span>
									<div id="lower-value"></div>
									<div class="to">to</div>
									<span>$</span>
									<div id="upper-value"></div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<select>
								<option value="1">Sorting</option>
								<option value="1">Name (A-Z)</option>
								<option value="1">Name (Z-A)</option>
								<option value="1">Price (A-Z)</option>
								<option value="1">Price (Z-A)</option>
								<option value="1">Color</option>
							</select>
						</div>
						<div class="sorting mr-auto">
							<select>
								<option value="1">--Show--</option>
								<option value="1">Show 12</option>
								<option value="1">Show 24</option>
								<option value="1">Show 36</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Search">
								<div class="input-group-append">
									<button type="button">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start Best Seller -->
					<section class="lattest-product-area pb-40 category-list">

						<div class="row">

							<c:forEach var="item" items="${products.listResult}">
								<div class="col-md-6 col-lg-4">
									<div class="card text-center card-product">

										<div class="card-product__img">
											<img class="card-img" src="web/img/product/${item.image}" alt="">
											<ul class="card-product__imgOverlay">
												<li><a href='<c:url value='/${item.uri}'/>'> <button>
														<i class="ti-search"></i>
														</button>
													</a></li>

												<li><button onclick="return dangky(${item.id})">
														<i class="ti-shopping-cart"></i>
													</button></li>
												<li><button>
														<i class="ti-heart"></i>
													</button></li>
											</ul>
										</div>
										<form id="frm_${item.id}">
											<input type="hidden" value="${item.id}" name="productId">
											<input type="hidden" <c:if test="${not empty user}">
											value="<%=SecurityUtils.getPrincipal().getId()%>"
											</c:if>
											name="userId"> <input type="hidden" value="1" name="amount">
										</form>

										<div class="card-body">
											<p>Accessories</p>
											<h4 class="card-product__title">
												<a href="#">${item.name}</a>
											</h4>
											<p class="card-product__price">$${item.price}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</section>



					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link" aria-label="Previous"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							<li class="page-item"><a href="#" class="page-link">01</a></li>
							<li class="page-item active"><a href="#" class="page-link">02</a>
							</li>
							<li class="page-item"><a href="#" class="page-link">03</a></li>
							<li class="page-item"><a href="#" class="page-link">04</a></li>
							<li class="page-item"><a href="#" class="page-link">09</a></li>
							<li class="page-item"><a href="#" class="page-link" aria-label="Next"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	</section>
	<!-- End Best Seller -->

	<!-- ================ category section end ================= -->

	<!-- ================ top product area start ================= -->
	<%@include file="/common/web/top_product.jsp"%>
	<!-- ================ top product area end ================= -->

	<!-- ================ Subscribe section start ================= -->
	<%@include file="/common/web/subscribe.jsp"%>
	<!-- ================ Subscribe section end ================= -->


	<!--================ Start footer Area  =================-->
	<%@include file="/common/web/footer.jsp"%>
	<!--================ End footer Area  =================-->



	<%@include file="/common/web/js.jsp"%>

	<script>
		$('#categoryCK input').on('change', function () {
			setTimeout(() => {
				window.location.href = "" + $('input[name=radioCa]:checked', '#categoryCK').val();
			}, 300);
		});
	</script>

	<c:url var="APIurl" value="/api/cart" />
	<c:url var="NewURL" value="/login" />

	<script>
		function dangky(index) {
			

			var data = {};
			var formData = $('#frm_' + index).serializeArray();
			$.each(formData, function (i, v) {
				data["" + v.name + ""] = v.value;
			});
			var test = 0;
			$.each(data, function (n, v) {
				if (v == "") {
					test++;
				}
			});
			if (test > 0) {
				swal({
					title: "Error!",
					text: "You need login!",
					icon: "warning",
					button: "Login now",
				}).then(function (isConfirm) {
					window.location.href = "login";
				})
			} else {
				addNew(data);
			}
			return false;

		}

		function addNew(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					swal({
						title: "Successful!",
						text: "Successfully added product to cart!",
						icon: "success",
						button: false,
						timer: 1000
					});
					var so = parseInt($('#soluong').html()) + 1;
					$('#soluong').html(so);
				},
				error: function (error) {
					swal("Failed !",
						"Add failure! Products already in the cart.", "error");
				}
			});
		}
	</script>


</body>

</html>