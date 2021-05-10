<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="BookRide" id="frm">
	<input type="hidden" name="provider_id" id="pro">
	<input type="hidden" name="rider_id" id="raid">
	<input type="hidden">
	</form>
	
	<script type="text/javascript">
	var form = document.getElementById("frm");
	var pr = document.getElementById("pro");
	pr.value="<%= session.getAttribute("p_id")%>";
	var raid = document.getElementById("raid");
	raid.value="<%= session.getAttribute("r_id")%>";
	form.submit();
	</script>
</body>
</html>