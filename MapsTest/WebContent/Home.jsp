<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="loginCSS.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>InstaRide | Home</title>
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no" />
<script
	src="https://apis.mapmyindia.com/advancedmaps/v1/MAPS_API_KEY/map_load?v=1.5&plugin=cluster"></script>
<style>
#map {
	top: 20;
	left: 500px;
	width: 1035px;
	height: 763px;
}

#logout {
	bottom: 10px;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<div class="grid-container">
		<div class="sidenav grid-child purple">
			<div class="login-main-text">
				<h2>
					Welcome ${uname}
					<form action="Logout">
						<button type="submit" class="btn btn-secondary btn-block"
							value="Register">Logout</button>
					</form>
				</h2>
			</div>
		</div>

		<div id="map" class="grid-child">
			<script src="map.js"></script>
		</div>

	</div>
</body>
</html>