<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>
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
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Register</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Already have an account?</h4>
							<p>There are advances being made in science and technology
								everyday, and a good example of this is the</p>
							<a class="button button-account" href="/login">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" id="formSubmit" autocomplete="off">
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="userName" name="userName" placeholder="Username"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="fullName" name="fullName" placeholder="Full Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Full Name'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="password" name="password" placeholder="Password"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="confirmPassword" name="confirmPassword"
									placeholder="Confirm Password" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Confirm Password'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<a><input type="button" id="dangky"
									class="button button-register w-100" value="Register" /></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<!--================ Start footer Area  =================-->
	<%@include file="/common/web/footer.jsp"%>
	<!--================ End footer Area  =================-->

	<%@include file="/common/web/js.jsp"%>


	<c:url var="APIurl" value="/api/user" />
	<c:url var="NewURL" value="/login" />

	<script>
		$('#dangky').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var test = 0;
			$.each(data, function(n,v){
				if(v==""){
					test++;
				}
			});
			if(test>0){
				swal("You have not entered all data!");
			}
			else{
				if ($("#password").val() != $("#confirmPassword").val()) {
					alert("Password not match !");
				} else {
					addNew(data);
				}
			}
			
		});
		function addNew(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					swal({
						title : "Successful!",
						text : "Account registration is successful!",
						icon : "success",
						button : "Login now",
					}).then(function(isConfirm) {
						window.location.href = "login";
					})
				},
				error : function(error) {
					swal("Register failed !",
							"Username or password is not available!", "error");
				}
			});
		}
	</script>
</body>

</html>