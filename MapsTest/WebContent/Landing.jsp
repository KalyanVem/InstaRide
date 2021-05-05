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
	
	<title>InstaRide</title>
	

	<link rel="stylesheet" href="css/bootstrap.min.css"></link>
	<!-- <link rel="stylesheet"  href="css/style.css"> -->
	
	<!-- google fonts- oxygen -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400&display=swap" rel="stylesheet">

	<style type="text/css">
		*{
			font-family: 'Oxygen', sans-serif;
			font-size: 16px;
		}
		html{

			background-color: #Ececec;
		}
		body{
			box-sizing: border-box;
			background-color: #Ececec;
		}
		#side{
			height: inherit;
			background-color: #056594;
			padding-left: 0;
			border-top-left-radius: 10px;
			border-bottom-left-radius: 10px; 
			padding-top: 10vh;
			padding-left: 10vw;	
			color: white;
		}

		#login-form{
			width: 80vw;
			margin: auto;
			height: 480px;
			margin-top: 15vh;
			border-radius: 10px;
			border-color: darkslategray;
			box-shadow: 0 10px 10px 5px darkslategrey;
		}

		#main-content{
			padding-top:10%;
			border-top-right-radius: 10px;
			border-bottom-right-radius: 10px; 
			position: relative;
			background-color: lightslategray;
			height: inherit;
			padding-left: 8%;	
		}
		#main-content a{
			width: 100px;
			height: 30px;
			text-align: center;
			background-color: white;
			border:1px solid white;
			border-radius: 5px;
			margin: 10px 10px;
			text-decoration: none;
		}
		a:hover{
			color: green;
		}
		@media(max-width: 767px){
			#main-content{ border-radius:10px;}
		}
	</style>
</head>
<body>
	<%
	if (session.getAttribute("uname") != null) {
		response.sendRedirect("Home.jsp");
	}
	%>
	<form id="login-form" class="row">
		<div id="side" class="col-md-6 visible-md visible-lg">
			<h1>InstaRide</h1>
			<span>Welcome. Please choose an option to continue</span>
		</div>
		<div class="col-md-6" id="main-content">
			<a href="LoginRider.jsp" class="col-md-3">User</a>
			<a href="Login.jsp" class="col-md-3">Provider</a>	
		</div>
	</form>

	<!-- jQuery (Bootstrap JS plugins depend on it) -->
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>