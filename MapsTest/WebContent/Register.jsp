<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | InstaRide</title>
</head>
<body>
	<div id="register">
		<form method="post" action="Register">
			Username:<input type="text" name="uname"><br>
			First Name:<input type="text" name="fName"><br>
			Last Name:<input type="text" name="lName"><br>
			Aadhar Id:<input type="text" name="aadhar"><br>
			Mobile Number:<input type="text" name="mobile"><br>
			E-mail Id:<input type="text" name="email"><br>
			Password:<input type="password" name="pass"><br>
			Re-enter Password:<input type="password" name="repass"><br>
			<input type="submit" value="Register">
		</form>
		
		<form action="Login" method="post">
			Already have an account? <input type="submit" value="Login">
		</form>
	</div>
</body>
</html>