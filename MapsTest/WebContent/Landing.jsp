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
<title>User Select</title>
</head>
<body>
	<%
	if (session.getAttribute("uname") != null) {
		response.sendRedirect("Home.jsp");
	}
	%>
	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Welcome to<br> InstaRide
			</h2>
			<p>Select your role to Login.</p>
		</div>
	</div>

	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
					<div class="grid-container">
						<div class="grid-item">
						<form action="Provider">
							<input type="submit"  class="btn btn-black btn-block" value="Provider">
						</form>
					</div>
					<div class="grid-item">
						<form action="Consumer">
							<input type="submit"  class="btn btn-secondary btn-block" value="Consumer">
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>