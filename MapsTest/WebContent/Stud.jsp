<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String GetLocationsql = "select * from provider_location";
String getAadhar = "select aadhar from login where uname=?";
String GetAddressRider = "select * from rider_address where rider_id=?";

String url = "jdbc:postgresql://localhost/JMaps";
String dbUname = "postgres";
String dbPass = "1234";
try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>first name</td>
<td>last name</td>
<td>City name</td>
<td>Email</td>

</tr>
<%
try{
	
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(url, dbUname, dbPass);
	PreparedStatement st = con.prepareStatement(GetAddressRider);
	st.setString(1, "r9");
	ResultSet resultSet = st.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("rider_id") %></td>
<td><%=resultSet.getString("address") %></td>
</tr>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>