<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>List Product</title>
	<%@include file="/common/admin/css.jsp"%>

</head>

<body>
	<!-- Pre-loader start -->
	<%@include file="/common/admin/loader.jsp"%>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<%@include file="/common/admin/header.jsp"%>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@include file="/common/admin/menu.jsp"%>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">Product</h5>
											<p class="m-b-0">There are ${products.totalItem} products</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.html"> <i class="fa fa-home"></i>
												</a></li>
											<li class="breadcrumb-item"><a href="#!">Tables</a></li>
											<li class="breadcrumb-item"><a href="#!">Products</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
											<!-- Material statustic card start -->
											<div class="col-xl-12 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>Products</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-option">
																<li><i title="Option"
																		class="fa fa fa-wrench open-card-option"></i>
																</li>
																<li><i title="Search" class="fa fa-search"
																		aria-hidden="true"></i></li>
																<li><a href="/admin/edit_product"><i title="Insert"
																			class="fa fa-plus"
																			aria-hidden="true"></i></a></li>
																<li><i title="Edit" class="fa fa-pencil-square-o"
																		aria-hidden="true"></i></li>
																<li><a onclick="warningBeforeDelete()"><i title="Delete"
																			class="fa fa-trash-o"
																			aria-hidden="true"></i></a></li>
															</ul>
														</div>
													</div>

													<c:if test="${not empty products.listResult}">
														<div class="card-block table-border-style">
															<div class="table-responsive">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th><input type="checkbox" id="checkAll" />
																			</th>
																			<th>Image</th>
																			<th>Name</th>
																			<th>Price</th>
																			<th>Sale</th>
																			<th>Brand</th>
																			<th>Color</th>
																			<th>Size</th>

																			<th>Quanlity</th>
																			<th>Favorite</th>
																			<th>Sold</th>
																			<th>Short Decription</th>
																			<th>Decription</th>
																			<th></th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="item"
																			items="${products.listResult}">
																			<tr>
																				<th scope="row"><input type="checkbox"
																						value="${item.id}" /></th>
																				<td><img style="width: 88px; height: 111px; object-fit: cover;"
																						src="web/img/product/${item.image}">
																				</td>
																				<td>${item.name}</td>
																				<td>${item.price}</td>
																				<td>${item.priceSale}</td>
																				<td>${item.brand}</td>
																				<td>${item.color}</td>
																				<td>${item.size}</td>

																				<td>${item.quanlity}</td>
																				<td>${item.favorite}</td>
																				<td>${item.sold}</td>
																				<td>${item.shortDecription}</td>
																				<td>${item.decription}</td>
																				<td><a
																						href="/admin/edit_product?id=${item.id}"><i
																							title="Edit"
																							class="fa fa-pencil-square-o"
																							aria-hidden="true"></i></a>
																				</td>
																			</tr>
																		</c:forEach>

																	</tbody>
																</table>
															</div>
														</div>
													</c:if>
													<c:if test="${empty products.listResult}">
														<div class="card-block">
															<h4 class="sub-title">Don't have any product</h4>
														</div>
													</c:if>

												</div>
												<!-- Hover table card end -->

											</div>

										</div>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="/common/admin/js.jsp"%>

	<c:url var="APIurl" value="/api/product" />
	<c:url var="NewURL" value="/admin/product" />
	<script type="text/javascript">
		$("#checkAll").click(function () {
			$('input:checkbox').not(this).prop('checked', this.checked);
		});

		function warningBeforeDelete() {
			var n = $("input:checked").length;
			if (n == 0) {
				thongbao("Erorr !", " You need to check the product to delete.", "animated fadeInRight");
			} else {
				var ids = $('tbody input[type=checkbox]:checked')
					.map(function () {
						return $(this).val();
					}).get();
				deleteNew(ids);
			}
		}

		function deleteNew(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					thongbao("Successful !", " Product deleted successfully.", "animated fadeInRight");
					setTimeout(() => {
						window.location.href = "${NewURL}";
					}, 1500);
				},
				error: function (error) {
					thongbao("Failed !", "  Could not delete selected product.", "animated fadeInRight");
				}
			});
		}

		function notify(from, align, icon, type, animIn, animOut, title, message, enter) {
			var title = title;
			var message = message;
			var enter = enter;
			$.growl({
				icon: icon,
				title: title,
				message: message,
				url: '/admin/home'
			}, {
				element: 'body',
				type: 'primary',
				allow_dismiss: true,
				placement: {
					from: from,
					align: align
				},
				offset: {
					x: 30,
					y: 30
				},
				spacing: 10,
				z_index: 999999,
				delay: 2500,
				timer: 800,
				url_target: '/admin/home',
				mouse_over: false,
				animate: {
					enter: enter,
					exit: animOut
				},
				icon_type: 'class',
				template: '<div data-growl="container" class="alert" role="alert">' +
					'<button type="button" class="close" data-growl="dismiss">' +
					'<span aria-hidden="true">&times;</span>' +
					'<span class="sr-only">Close</span>' +
					'</button>' +
					'<span data-growl="icon"></span>' +
					'<span data-growl="title"></span>' +
					'<span data-growl="message"></span>' +
					'<a href="#" data-growl="url"></a>' +
					'</div>'
			});
		};

		function thongbao(title, message, enter) {
			var nFrom = $(this).attr('data-from');
			var nAlign = $(this).attr('data-align');
			var nIcons = $(this).attr('data-icon');
			var nType = $(this).attr('data-type');
			var nAnimIn = $(this).attr('data-animation-in');
			var nAnimOut = $(this).attr('data-animation-out');
			notify(nFrom, nAlign, nIcons, nType, nAnimIn, nAnimOut, title, message, enter);
		};
	</script>
</body>

</html>