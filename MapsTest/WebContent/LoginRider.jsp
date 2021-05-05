<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!--browser sync in the (parent cd eg:week3) 
		browser-sync start --server --directory --files "**/*"-->
	<meta charset="utf-8">

	<!-- tells some ie to use latest rendering versions -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial=scaile=1">
	
	<title>Login Rider</title>
	<style><%@include file="/css/bootstrap.min.css"%></style>
	<style><%@include file="/css/style.css"%></style>
	
	<!-- google fonts- oxygen -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>
	<% 
		if(session.getAttribute("uname")!=null){
			response.sendRedirect("Home.jsp");
		}
	%>
	<form action="LoginRider" method="post" id="login-form" class="row">
		<div id="side" class="col-md-6 visible-md visible-lg">
			<h1>InstaRide</h1>
			<span>Login</span>
		</div>
		<div class="col-md-6" id="main-content">
			<label class="lbl">Username</label>
			<input type="text" name="uname" class="lbl">
			<label class="lbl">Password</label>
			<input type="password" name="pass" class="lbl"><br>
			<div class="lbl">
				<button class="col-md-5" type="submit"> Login</button>
				<button class="col-md-5" type="reset"> Clear</button>		
			</div>
			<label class="lbl">
				<input type="checkbox" name="remember-me">
				Remember Me
			</label>
			<label class="lbl">
				<a href="#">Forgot Password ?</a>
			</label>
			<hr >
			<label class="lbl">
				<span>Don't have an account ?</span>
				<a href="RegisterRider.jsp">Sign Up</a>
			</label>
			
		</div>
	</form>

	<!-- jQuery (Bootstrap JS plugins depend on it) -->
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/script.js"></script>
</body>
</html>