<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!--browser-sync start --server --directory --files "**/*"-->
	<meta charset="utf-8">

	<!-- tells some ie to use latest rendering versions -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial=scaile=1">
	
	<title>Sign-Up Page</title>
	

	<link rel="stylesheet" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet"  href="css/style.css">
	
	<!-- google fonts- oxygen -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>
	<form id="signup-form" class="row" method="post" action="RegisterRider">
		<div id="side" class="col-md-6 visible-md visible-lg">
			<h1>InstaRide</h1>
			<span>Sign Up - Raider</span>
		</div>
		<div class="col-md-6" id="main-content">
			<label class="lbl">Username</label>
			<input type="text" name="uname" class="lbl">
			<label class="lbl">First name</label>
			<input type="text" name="fName" class="lbl">
			<label class="lbl">Last name</label>
			<input type="text" name="lName" class="lbl">
			<label class="lbl">Email</label>
			<input type="email" name="email" class="lbl">
			<label class="lbl">Phone Number</label>
			<input type="tel" id="phone" name="mobile" pattern="[0-9]+" class="lbl" maxlength="10" size="10">
			<label class="lbl">Password</label>
			<input type="password" name="pass" class="lbl" minlength="8">
			<label class="lbl">Re-Enter Password</label>
			<input type="password" name="repass" class="lbl" minlength="8"><br>
			<div class="lbl">
				<button class="col-md-5" type="submit"><span class="glyphicon glyphicon-log-in"></span> SignUp</button>
				<button class="col-md-5"  type="reset"><span class="glyphicon glyphicon-repeat"></span> Clear</button>
			</div>
			
			
			<hr >
			<label class="lbl">
				<span>Already have an account ?</span>
				<a href="LoginRider.jsp">Login</a>
			</label>
		</div>
	</form>

	<!-- jQuery (Bootstrap JS plugins depend on it) -->
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/script.js"></script>
</body>
</html>
