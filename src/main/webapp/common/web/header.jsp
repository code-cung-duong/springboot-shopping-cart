<%@include file="/common/taglib.jsp"%>
<%@page import="com.util.SecurityUtils"%>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand logo_h" href=""><img
					src="web/img/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
						<li class="nav-item"><a class="nav-link" href="/home">Home</a></li>
						<li class="nav-item active submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/shop' />">Shop Category</a></li>
								<li class="nav-item"><a class="nav-link" href="s">Product
										Details</a></li>
								<li class="nav-item"><a class="nav-link" href="">Product
										Checkout</a></li>
								<li class="nav-item"><a class="nav-link" href="">Confirmation</a></li>
								<li class="nav-item"><a class="nav-link" href="cart.html">Shopping
										Cart</a></li>
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="">Blog</a></li>
								<li class="nav-item"><a class="nav-link" href="">Blog
										Details</a></li>
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
								<li class="nav-item"><a class="nav-link" href="">Register</a></li>
								<li class="nav-item"><a class="nav-link" href="">Tracking</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="">Contact</a></li>
					</ul>

					<ul class="nav-shop">
						<li class="nav-item"><button>
								<i class="ti-bell"></i>
							</button></li>
						<li class="nav-item"><a href='<c:url value="/cart" />'><button>
									<i class="ti-shopping-cart" title="Shopping card"></i>
									<sec:authorize access="isAuthenticated()">
										<span id="soluong" class="nav-shop__circle"><%=SecurityUtils.getPrincipal().getCountProductByCart()%></span>
									</sec:authorize>
								</button></a></li>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item"><a class="button button-header"
								href="<c:url value='/login' />">Login</a></li>
							<a class="button button-login" href="/register">Register</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item"><i><span> Hi, </span><b><%=SecurityUtils.getPrincipal().getFullName()%></b></i></li>
							<li class="nav-item"><a class="button button-login"
								href="<c:url value='/logout' />">Logout</a></li>
						</sec:authorize>

						
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>