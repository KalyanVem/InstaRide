<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Select</title>
</head>
<body>
<% if(session.getAttribute("uname")!=null){
			response.sendRedirect("Home.jsp");
		} %>
	
	Select your role:<br>
	<form action="Provider">
		<input type="submit" value = "Provider">
	</form>
	<form action="Consumer">
		<input type="submit" value = "Consumer">
	</form>
</body>
</html>