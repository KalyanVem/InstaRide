<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controller.Profile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String GetLocationsql = "select * from provider_location";
String getEmail = "select email from provider where provider_id=?";
String GetAddressRider = "select * from provider_address where provider_id=?";

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
<head>
	<!--browser sync in the (parent cd eg:week3) 
		browser-sync start --server --directory --files "**/*"-->
	<meta charset="utf-8">

	<!-- tells some ie to use latest rendering versions -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial=scaile=1">
	
	<title>Profile - Rider</title>
	

	<link rel="stylesheet" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet"  href="css/style.css">
	
	<!-- google fonts- oxygen -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
	<!-- google fonts- lora// for brand -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Lora&display=swap" rel="stylesheet">
	<style type="text/css">
        table {
            margin: 0 auto;
            font-size: large;
            border: 1px solid black;
            border-radius: 5px;
            overflow: scroll;
        }
  
        h1 {
            text-align: center;
            color: #006600;
            font-size: xx-large;
        }
  
        td,th {
            background-color: white;
            border: 1px solid black;
            width: 12%;
            text-align: left;
        }
  
        th{
            font-size: 1.2em;
            color: #056594;
            /*border-right: 0px;*/
            
        }
  
        td {
            font-weight: lighter;
            padding: 5px;
            color: black;
            /*border-left: 0px;*/
            
        }
        .jumbotron{
            height: auto;
        }
    </style>
</head>
<body>
<header>
	<nav id="header-nav" class="navbar navbar-default">
		<div class="container">
			<div  class="navbar-header">
				<a href="index.html" class="pull-left visible-sm visible-md visible-lg">
					<div id="logo-image" alt="Logo Image"></div>
				</a>

				<div class="navbar-brand">
					<a href="index.html">
						<h1>Insta Ride</h1>
					</a>
					<p>
						<img src="" alt="User Pic" id= "User-logo">
						<span>Profile - Provider</span>
					</p>
				</div>

				
				    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				    </button>	
			</div>

			<div id="collapsable-nav" class="collapse navbar-collapse">
				<!-- for items to float on right side=navbar-right -->
				<ul id="nav-list" class="nav navbar-nav navbar-right">
					<li>
						<a href="Landing.jsp">
							<span class="glyphicon glyphicon-home"></span><br class="hidden-xs">Home</a>
					</li>
					<li>
						<!--br for next line-->
						<a href="ProfileProvider.jsp">
							<span class="glyphicon glyphicon-user"></span><br class="hidden-xs">Profile</a>
					</li>
					<li>
						<a href="ProviderHistory.jsp">
							<span class="glyphicon glyphicon-th-list"></span><br class="hidden-xs">Ride History</a>
					</li>
					<li>
						<a href="UpcomingProviderRides.jsp">
							<span class="glyphicon glyphicon-bell"></span><br class="hidden-xs">Upcoming Rides</a>
					</li>
					<li>
					
					<form action="Logout">
						<button>
							<span class="glyphicon glyphicon-log-out" ></span>
							<br class="hidden-xs">Logout
						</button>
						</form>
						
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>

	

<div class="container" id="main-content">
	<div class="jumbotron">
				<!-- <img src="" alt="" class="visible-xs img-responsive"> -->
				<table>
		
<%
try{
	
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(url, dbUname, dbPass);
	PreparedStatement st = con.prepareStatement(GetAddressRider);
	PreparedStatement stmt = con.prepareStatement(getEmail);
	st.setString(1, (String)session.getAttribute("uname"));
	stmt.setString(1, (String)session.getAttribute("uname"));
	ResultSet resultSet = st.executeQuery();
	ResultSet rs = stmt.executeQuery();
while(resultSet.next()){
%>
<tr>
<th><%="Name: "%></th>
<td><%=resultSet.getString("provider_id") %></td>
</tr>

<tr>
<th><%="Address: "%></th>
<td><%=resultSet.getString("address") %></td>
</tr>

<%while(rs.next()){ %>
<tr>
<th><%="Email: "%></th>
<td><%=rs.getString("email") %></td>
</tr>
<%} %>

<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>


			</table>
		</div>

	<!-- home tiles -->
	<div class="row" id="home-tiles">
		
	</div><!-- End of home-tiles -->
</div> <!-- End of main-content -->
	
<footer class="panel-footer">
	<div class="container">
		<div class=" row">
			
			<div class="text-center" id="copy-right">&copy; <a href="">Team12</a>InstaRide
			</div>
		</div>
		
	</div>
</footer>
	<!-- jQuery (Bootstrap JS plugins depend on it) -->
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>