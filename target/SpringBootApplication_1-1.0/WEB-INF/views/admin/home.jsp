<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Admin Home</title>
	<%@include file="/common/admin/css.jsp"%>

</head>

<body>
	<!-- Pre-loader start -->
	<%@include file="/common/admin/loader.jsp"%>
	<!-- Pre-loader end -->

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<!-- ===============Header=================== -->
			<%@include file="/common/admin/header.jsp"%>
			<!-- =============== End Header=================== -->

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!-- =============== Menu =================== -->
					<%@include file="/common/admin/menu.jsp"%>
					<!-- =============== End Menu =================== -->
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">Dashboard</h5>
											<p class="m-b-0">Welcome to Material Able</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="/admin/home"> <i
														class="fa fa-home"></i>
												</a></li>
											<li class="breadcrumb-item"><a href="#!">Dashboard</a></li>
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
											<div class="col-xl-4 col-md-12">
												<div class="card mat-stat-card">
													<div class="card-block">
														<div class="row align-items-center b-b-default">
															<div class="col-sm-6 b-r-default p-b-20 p-t-20">
																<div class="row align-items-center text-center">
																	<div class="col-4 p-r-0">
																		<i class="far fa-user text-c-purple f-24"></i>
																	</div>
																	<div class="col-8 p-l-0">
																		<h5>10K</h5>
																		<p class="text-muted m-b-0">Visitors</p>
																	</div>
																</div>
															</div>
															<div class="col-sm-6 p-b-20 p-t-20">
																<div class="row align-items-center text-center">
																	<div class="col-4 p-r-0">
																		<i
																			class="fas fa-volume-down text-c-green f-24"></i>
																	</div>
																	<div class="col-8 p-l-0">
																		<h5>100%</h5>
																		<p class="text-muted m-b-0">Volume</p>
																	</div>
																</div>
															</div>
														</div>
														<div class="row align-items-center">
															<div class="col-sm-6 p-b-20 p-t-20 b-r-default">
																<div class="row align-items-center text-center">
																	<div class="col-4 p-r-0">
																		<i class="far fa-file-alt text-c-red f-24"></i>
																	</div>
																	<div class="col-8 p-l-0">
																		<h5>2000+</h5>
																		<p class="text-muted m-b-0">Files</p>
																	</div>
																</div>
															</div>
															<div class="col-sm-6 p-b-20 p-t-20">
																<div class="row align-items-center text-center">
																	<div class="col-4 p-r-0">
																		<i
																			class="far fa-envelope-open text-c-blue f-24"></i>
																	</div>
																	<div class="col-8 p-l-0">
																		<h5>120</h5>
																		<p class="text-muted m-b-0">Mails</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
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

	<script>
		$(window).on('load', function () {
			function notify(message, type) {
				$.growl({
					message: message
				}, {
					type: type,
					allow_dismiss: false,
					label: 'Cancel',
					className: 'btn-xs btn-inverse',
					placement: {
						from: 'bottom',
						align: 'right'
					},
					delay: 2500,
					animate: {
						enter: 'animated fadeInRight',
						exit: 'animated fadeOutRight'
					},
					offset: {
						x: 30,
						y: 30
					}
				});
			};
			notify('Welcome <%=SecurityUtils.getPrincipal().getFullName()%> to Admin page', 'inverse');
		})
	</script>
</body>

</html>