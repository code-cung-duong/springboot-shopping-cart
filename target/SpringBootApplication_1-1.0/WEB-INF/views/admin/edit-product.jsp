<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<%@include file="/common/admin/css.jsp"%>
<script src="admin/jquery.twbsPagination.js" type="text/javascript"></script>

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
											<c:if test="${empty param.id}">
												<h5 class="m-b-10">Insert Product</h5>
												<p class="m-b-0">Insert product</p>
											</c:if>
											<c:if test="${not empty param.id}">
												<h5 class="m-b-10">Edit Product</h5>
												<p class="m-b-0">Edit product</p>
											</c:if>

										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.html"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="#!">Tables</a></li>
											<c:if test="${empty param.id}">
												<li class="breadcrumb-item"><a href="#!">Insert
														Product</a></li>
											</c:if>
											<c:if test="${not empty param.id}">
												<li class="breadcrumb-item"><a href="#!">Edit
														Product</a></li>
											</c:if>

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
														<h5>
															<c:if test="${not empty param.id}">Edit Product</c:if>
															<c:if test="${empty param.id}">Insert Product</c:if>
														</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-option">
																<li><i class="fa fa fa-wrench open-card-option"></i></li>
																<li><i class="fa fa-window-maximize full-card"></i></li>
																<li><i class="fa fa-minus minimize-card"></i></li>
																<li><i class="fa fa-refresh reload-card"></i></li>
																<li><i class="fa fa-trash close-card"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block">
														<h4 class="sub-title">Please enter enough product
															information</h4>
														<form id="formSubmit" autocomplete="off">
															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Category</label>
																<div class="col-sm-10">
																	<select name="categoryid" class="form-control">
																		<option value="">----- Select One Category
																			-----</option>
																		<c:forEach var='item' items="${categories.listResult}">
																			<option value="${item.id}"
																				<c:if test="${item.id == product.categoryid}">selected</c:if>>${item.name}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>

															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Image
																	File</label>
																<div class="col-sm-10">
																	<input id="image" value="${product.image}"
																		type="file" class="form-control">
																</div>
															</div>

															<c:if test="${not empty param.id }">
																<div class="form-group row">
																	<label class="col-sm-2 col-form-label">Image
																		Show</label>
																	<div class="col-sm-10">
																		<img
																			style="width: 222px; height: auto; object-fit: cover;"
																			src="web/img/product/${product.image}">
																	</div>
																</div>
															</c:if>



															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Name</label>
																<div class="col-sm-10">
																	<input name="name" type="text" value="${product.name}"
																		class="form-control">
																</div>
															</div>

															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Price</label>
																<div class="col-sm-10">
																	<input name="price" type="text"
																		value="${product.price}" class="form-control">
																</div>
															</div>


															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Price
																	Sale</label>
																<div class="col-sm-10">
																	<input name="priceSale" type="text"
																		value="${product.priceSale}" class="form-control">
																</div>
															</div>


															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Brand</label>
																<div class="col-sm-10">
																	<input name="brand" type="text"
																		value="${product.brand}" class="form-control">
																</div>
															</div>


															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Color</label>
																<div class="col-sm-10">
																	<input name="color" type="text"
																		value="${product.color}" class="form-control">
																</div>
															</div>

															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Size</label>
																<div class="col-sm-10">
																	<input name="size" type="text" value="${product.size}"
																		class="form-control">
																</div>
															</div>


															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Quanlity</label>
																<div class="col-sm-10">
																	<input name="quanlity" type="text"
																		value="${product.quanlity}" class="form-control">
																</div>
															</div>



															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Short
																	Decription</label>
																<div class="col-sm-10">
																	<textarea name="shortDecription" rows="3" cols="5"
																		class="form-control" placeholder="">${product.shortDecription}</textarea>
																</div>
															</div>

															<div class="form-group row">
																<label class="col-sm-2 col-form-label">Decription</label>
																<div class="col-sm-10">
																	<textarea name="decription" rows="5" cols="5"
																		class="form-control" placeholder="">${product.decription}</textarea>
																</div>
															</div>

															<input type="hidden" id="id" name="id"
																value="${product.id}">


															<div
																style="display: flex; justify-content: center; padding: 40px 0 20px 0;">
																<button id="dangky"
																	class="btn btn-primary waves-effect waves-light">
																	<c:if test="${empty param.id}">Insert product</c:if>
																	<c:if test="${not empty param.id}">Edit product</c:if>
																</button>
															</div>

														</form>


													</div>
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
	<c:url var="NewURL" value="edit_product" />
	<c:if test="${not empty product.id}">
		<c:url var="NewURL" value="product" />
	</c:if>

	<script>
		$('#dangky').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			data['image'] = $('#image').val().split("\\")[2];
			var test = 0;
			$.each( data, function( key, value ) {
				  if(value==""){
					  test++;
				  }
				});
			if(test<=1){
				var id = $('#id').val();
				if (id != "") {
					edit(data);
				} else {
					add(data);
				}
			}
			else{
				thongbao("Error !", "  You have not entered all of the data.", "animated fadeInRight");
			}
			
		});
		function add(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					thongbao("Sucessful !", "  Product added successfully.", "animated fadeInRight");
					$("#formSubmit").find("input[type=text]").val('');  
				},
				error : function(error) {
					thongbao("Failed !", "  Could not add a product.", "animated fadeInRight");
				}
			});
		}

		function edit(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					thongbao("Successful !", " Product edited successfully.", "animated fadeInRight");
					setTimeout(() => {  window.location.href = "${NewURL}"; }, 1500);
				},
				error : function(error) {
					thongbao("Failed !", "  Could not edit a product.", "animated fadeInRight");
				}
			});
		}
		
		
		function notify(from, align, icon, type, animIn, animOut, title, message, enter){
			var title = title;
			var message = message;
			var enter = enter;
		    $.growl({
		        icon: icon,
		        title: title,
		        message: message,
		        url: '/admin/home'
		    },{
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
		  
		function thongbao(title, message, enter){
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