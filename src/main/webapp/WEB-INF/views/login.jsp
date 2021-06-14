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
					<h1>Login / Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Login/Register</li>
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
							<h4>New to our website?</h4>
							<p>There are advances being made in science and technology
								everyday, and a good example of this is the</p>
							<a class="button button-account" href="/register">Create an
								Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="/j_spring_security_check"
							method="post" autocomplete="off">
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="name" name="j_username" placeholder="Username"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" required="required" class="form-control"
									id="name" name="j_password" placeholder="Password"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="remember-me">
									<label for="f-option2">Remember me</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit"
									class="button button-login w-100">Log In</button>
								<a href="/">Forgot Password?</a>
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
</body>

</html>