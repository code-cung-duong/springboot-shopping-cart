<%@include file="/common/taglib.jsp"%>
<%@page import="com.util.SecurityUtils"%>

<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<img class="img-80 img-radius" src="admin/assets/images/author.jpg"
					alt="User-Profile-Image">
				<div class="user-details">
					<span id="more-details"><%=SecurityUtils.getPrincipal().getFullName()%><i
						class="fa fa-caret-down"></i></span>
				</div>
			</div>
			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href=""><i class="ti-user"></i>View
							Profile</a> <a href=""><i class="ti-settings"></i>Settings</a> <a
						href="/logout"><i class="ti-layout-sidebar-left"></i>Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="p-15 p-b-0">
			<form class="form-material">
				<div class="form-group form-primary">
					<input type="text" name="footer-email" class="form-control">
					<span class="form-bar"></span> <label class="float-label"><i
						class="fa fa-search m-r-10"></i>Search Friend</label>
				</div>
			</form>
		</div>
		<div class="pcoded-navigation-label">Navigation</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class='<c:if test="${not empty home_ac}">active</c:if>'><a
				href="/admin/home" class="waves-effect waves-dark"> <span
					class="pcoded-micon"><i class="ti-home"></i><b>D</b></span> <span
					class="pcoded-mtext">Dashboard</span> <span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<div class="pcoded-navigation-label">Tables</div>
		<ul class="pcoded-item pcoded-left-item">
			<li
				class="pcoded-hasmenu <c:if test="${not empty product_ac || not empty category_ac}">active</c:if>"><a
				href="javascript:void(0)" class="waves-effect waves-dark"> <span
					class="pcoded-micon"><i class="ti-id-badge"></i><b>A</b></span> <span
					class="pcoded-mtext">Tables</span> <span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class='<c:if test="${not empty product_ac}">active</c:if>'><a
						href="/admin/product" class="waves-effect waves-dark"> <span
							class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
							class="pcoded-mtext">Products</span> <span class="pcoded-mcaret"></span>
					</a></li>
					<li class="<c:if test="${not empty category_ac}">active</c:if>"><a href="/admin/category"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Categories</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="" class="waves-effect waves-dark"> <span
							class="pcoded-micon"><i class="ti-layout-sidebar-left"></i><b>S</b></span>
							<span class="pcoded-mtext">Users</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="" class="waves-effect waves-dark"> <span
							class="pcoded-micon"><i class="ti-layout-sidebar-left"></i><b>S</b></span>
							<span class="pcoded-mtext">Comments</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<div class="pcoded-navigation-label">Pages</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu "><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-id-badge"></i><b>A</b></span> <span class="pcoded-mtext">Pages</span>
					<span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=""><a href="/login" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext">Login</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="/register"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Registration</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="/home" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i
								class="ti-layout-sidebar-left"></i><b>S</b></span> <span
							class="pcoded-mtext">Home Page</span> <span class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<div class="pcoded-navigation-label">Pages</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu "><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-id-badge"></i><b>A</b></span> <span class="pcoded-mtext">Pages</span>
					<span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=""><a href="auth-normal-sign-in.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Login</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="auth-sign-up.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Registration</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="sample-page.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-layout-sidebar-left"></i><b>S</b></span> <span
							class="pcoded-mtext">Sample Page</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<div class="pcoded-navigation-label">Pages</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu "><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-id-badge"></i><b>A</b></span> <span class="pcoded-mtext">Pages</span>
					<span class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=""><a href="auth-normal-sign-in.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Login</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="auth-sign-up.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext">Registration</span>
							<span class="pcoded-mcaret"></span>
					</a></li>
					<li class=""><a href="sample-page.html"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-layout-sidebar-left"></i><b>S</b></span> <span
							class="pcoded-mtext">Sample Page</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
	</div>
</nav>


