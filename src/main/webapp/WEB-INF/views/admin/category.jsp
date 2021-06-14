<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Category</title>
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
											<h5 class="m-b-10">Category</h5>
											<c:if test="${not empty param.keyword}">
												<p class="m-b-0">${categories.totalItem} results found</p>

											</c:if>

											<c:if test="${empty param.keyword}">
												<p class="m-b-0">There are ${categories.totalItem}
													categories</p>
											</c:if>

										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="/admin/home"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="/admin/category">Tables</a></li>
											<li class="breadcrumb-item"><a href="#!">Categories</a></li>
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
														<div
															style="display: flex; justify-content: space-between; width: 100%;">
															<h5>Categories</h5>

														</div>

														<div class="card-header-right">
															<ul class="list-unstyled card-option">
																<li><i title="Option"
																	class="fa fa fa-wrench open-card-option"></i></li>
																<li><i title="Search" class="fa fa-search"
																	aria-hidden="true"></i></li>
																<li><a href="/admin/edit_category"><i
																		title="Insert" class="fa fa-plus" aria-hidden="true"></i></a></li>
																<li><i title="Edit" class="fa fa-pencil-square-o"
																	aria-hidden="true"></i></li>
																<li><a id="deleteBtn"
																	onclick="warningBeforeDelete()"><i title="Delete"
																		class="fa fa-trash-o" aria-hidden="true"></i></a></li>
															</ul>
														</div>
													</div>
													<div class="accordion-panel">
														<div class="accordion-heading" role="tab" id="headingOne">
															<h3 class="card-title accordion-title">
																<a
																	class="accordion-msg waves-effect waves-dark scale_active collapsed"
																	data-toggle="collapse" data-parent="#accordion"
																	href="#collapseOne" aria-expanded="false"
																	aria-controls="collapseOne">
																	<i class="fa fa-bars"
																	style="float: left;" aria-hidden="true"></i><i class="fa fa-bars"
																	style="float: right;" aria-hidden="true"></i></a>
															</h3>
														</div>
														<div id="collapseOne" class="panel-collapse in collapse"
															role="tabpanel" aria-labelledby="headingOne" style="">
															<div class="accordion-content accordion-desc">
																<form action="/admin/category" autocomplete="off">
																	<div class="row">
																		<div class="col-sm-8"></div>
																		<div class="col-sm-3">
																			<input required="required" id="key" type="text"
																				class="form-control form-control-lg"
																				style="height: 45px;"
																				placeholder="Enter keyword ..." name="keyword">
																		</div>
																		<div class="col-sm-1">
																			<button id="tim" type="submit"
																				class="btn btn-info waves-effect waves-light">
																				<i class="fa fa-search" aria-hidden="true"></i>
																			</button>

																		</div>

																	</div>
																</form>
															</div>
														</div>
													</div>
													<c:if test="${not empty categories.listResult}">
														<div class="card-block table-border-style">
															<div class="table-responsive">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th><input type="checkbox" id="checkAll" /></th>
																			<th>Code</th>
																			<th>Name</th>
																			<th></th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="item" items="${categories.listResult}">
																			<tr>
																				<th scope="row"><input type="checkbox"
																					value="${item.id}" /></th>
																				<td>${item.code}</td>
																				<td>${item.name}</td>
																				<td><a
																					href="/admin/edit_category?id=${item.id}"><i
																						title="Edit" class="fa fa-pencil-square-o"
																						aria-hidden="true"></i></a></td>
																			</tr>
																		</c:forEach>

																	</tbody>
																</table>
															</div>
														</div>
													</c:if>
													<c:if test="${empty categories.listResult}">
														<div class="card-block">
															<h4 class="sub-title">Don't have any category</h4>
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

	<c:url var="APIurl" value="/api/category" />
	<c:url var="NewURL" value="/admin/category" />

	<script type="text/javascript">
		
		$("#checkAll").click(function() {
			$('input:checkbox').not(this).prop('checked', this.checked);
		});
		
		function warningBeforeDelete() {
			var n = $("input:checked").length;
			if(n==0){
				thongbao("Erorr !", " You need to check the category to delete.", "animated fadeInRight");
			}
			else{
				var ids = $('tbody input[type=checkbox]:checked')
				.map(function() {
					return $(this).val();
				}).get();
				deleteNew(ids);
			}
		}

		function deleteNew(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					thongbao("Successful !", " Category deleted successfully.", "animated fadeInRight");
					setTimeout(() => {  window.location.href = "${NewURL}"; }, 1500);
				},
				error : function(error) {
					thongbao("Failed !", "  Could not delete selected category.", "animated fadeInRight");
				}
			});
		}
		
		
	</script>
</body>

</html>