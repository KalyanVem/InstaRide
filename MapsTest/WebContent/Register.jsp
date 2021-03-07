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
<title>Register | InstaRide</title>
</head>
<body>

	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Welcome to<br> InstaRide Registration
			</h2>
			<p>Please provide the details to complete your registration.</p>
		</div>
	</div>

	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="register-form">
				<div class="form-group">
					<div id="register">
						<form method="post" action="Register">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username"
									name="uname">
							</div>
							<div class="form-group">
								<input type="text" placeholder="First Name" class="form-control"
									name="fName">
							</div>
							<div class="form-group">
								<input type="text" placeholder="Last Name" class="form-control"
									name="lName">
							</div>
							<div class="form-group">
								<input type="text" placeholder="Aadhar Id" class="form-control"
									name="aadhar">
							</div>
							<div class="form-group">
								<input type="text" placeholder="Mobile Number"
									class="form-control" name="mobile">
							</div>
							<div class="form-group">
								<input type="text" placeholder="E-mail Id" class="form-control"
									name="email">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password"
									class="form-control" name="pass">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Re-enter Password"
									class="form-control" name="repass">
							</div>
							<input type="submit" class="btn btn-black btn-block"
								value="Register">
						</form>

						<form action="Login" method="post">
							Already have an account? <input type="submit"
								class="btn btn-secondary btn-block" value="Login">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>