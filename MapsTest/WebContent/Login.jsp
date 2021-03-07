<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="loginCSS.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<% 
		if(session.getAttribute("uname")!=null){
			response.sendRedirect("Home.jsp");
		}
	%>


	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Welcome to<br> InstaRide Portal
			</h2>
			<p>Login to continue. Register if you are new.</p>
		</div>
	</div>

	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form action="Login" method="post">
					<div class="form-group">
						<label>Username:</label> <input type="text" class="form-control"
							placeholder="username" name="uname">
					</div>
					<div class="form-group">
						<label>Password: </label><input type="password"
							class="form-control" placeholder="password" name="pass">
					</div>
					<button type="submit" class="btn btn-black btn-block" value="Login">
						Login</button>
				</form>
				<p>Don't have an account?</p>
				<form action="RegRedirect" method="post">
					<button type="submit" class="btn btn-secondary btn-block"
						value="Register">Register</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>