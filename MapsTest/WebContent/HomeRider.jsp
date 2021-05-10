<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<head>
	<!--browser sync in the (parent cd eg:week3) 
		browser-sync start --server --directory --files "**/*"-->
	<meta charset="utf-8">

	<!-- tells some ie to use latest rendering versions -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial=scaile=1">
	
	<title>HomePage - User</title>
	

	<link rel="stylesheet" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet"  href="css/style.css">
	
	<!-- google fonts- oxygen -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
	<!-- google fonts- lora// for brand -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Lora&display=swap" rel="stylesheet">
	<script src="https://apis.mapmyindia.com/advancedmaps/v1/MAP_MY_INDIA_API_KEY/map_load?v=1.5&plugin=cluster">
	</script>
	<style type="text/css">
		
        /*map*/
        #map {
			top: 20;
			/*height: 763px;*/
			width: 100%;
		}
		/*Large device only*/
		@media (min-width: 1200px){
			#map{
				height: 675px;
			}
		}
		/*medium device only*/
		@media (min-width: 992px) and (max-width: 1199px){
			#map{
				height: 560px;
			}
		}
		/*small devices only*/
		@media (min-width: 768px) and (max-width: 991px){
			#map{
				height: 560px;
			}
		}
			/*extra small devices only*/
		@media (max-width: 767px){
			#map{
				height: 560px;
			}
		}
	</style>
</head>
<body>
<%
	if (session.getAttribute("uname") == null) {
		
	}
	session.setAttribute("role", "rider");;
	%>
	
	<%String locate =  (String)session.getAttribute("loc");%>
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
						<span>Home Page - User</span>
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
						<a href="ProfileRider.jsp">
							<span class="glyphicon glyphicon-user"></span><br class="hidden-xs">Profile</a>
					</li>
					<li>
						<a href="RiderHistory.jsp">
							<span class="glyphicon glyphicon-th-list"></span><br class="hidden-xs">Ride History</a>
					</li>
					<li>
						<a href="UpcomingRiderRides.jsp">
							<span class="glyphicon glyphicon-bell"></span><br class="hidden-xs">Requested Rides</a>
					</li>
					<li>
						<form action="LogoutRider">
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
		<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d7616.8030613596675!2d78.54362882392086!3d17.344401302417367!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e0!4m5!1s0x3bcb989fef0cf987%3A0x56f3391b9ad529ed!2sAlekhya%20Towers%2C%207-2-94%2F6%2C%20Inner%20Ring%20Rd%2C%20Vaishali%20Nagar%2C%20Sagar%20Enclave%2C%20Reddy%20Colony%2C%20Hastinapuram%2C%20Mytri%20Nagar%2C%20Bairamalguda%2C%20Karmanghat%2C%20Hyderabad%2C%20Telangana%20500079%2C%20India!3m2!1d17.3395799!2d78.5425703!4m5!1s0x3bcb99aa75f18961%3A0x46d3c0082bcfc8f1!2sLB%20NAGAR%20JUNCTION%2C%20Sri%2C%20LB%20Nagar%20-%20Uppal%20Rd%2C%20Mohan%20Nagar%2C%20Krishna%20Nagar%2C%20Bahadurguda%2C%20Telangana%20500074!3m2!1d17.346500799999998!2d78.5509187!5e0!3m2!1sen!2sin!4v1620226669835!5m2!1sen!2sin" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" class="visible-xs"></iframe> -->
		<div id="map" class="grid-child">
			<input type="hidden" id="loc"/>
		</div>
		<!-- <script src="map.js"></script> -->
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
	<script type="text/javascript">

	window.navigator.geolocation.getCurrentPosition((position) => {
	    var coords = position.coords;
	    var map = new MapmyIndia.Map('map', {
	        center: [coords['latitude'], coords['longitude']],
	        zoom: 15,
	        zoomControl: true,
	        hybrid: true,
	        location:true
	    });
	    L.marker([coords['latitude'], coords['longitude']]).addTo(map);
	                var a = document.createElement('a'); 
	                var link = document.createTextNode("Provider1");
	                a.appendChild(link); 
	                a.title = "Book this Ride"; 
	                a.href = "https://www.geeksforgeeks.org";
	                
	                var form = document.createElement("form");
	                form.method = "get";
	                form.action = "BookRide";
	                form.id = "book";

	                var btn = document.createElement("BUTTON");  //<button> element
					var t = document.createTextNode("Book"); // Create a text node
					form.appendChild(btn);
					btn.appendChild(t);   
					
					btn.onClick = function(){
						var frm = document.getElementById("book");	
						frm.submit();
						form.submit();
					};  
					<%
					try{
						
						Class.forName("org.postgresql.Driver");
						Connection con = DriverManager.getConnection(url, dbUname, dbPass);
						PreparedStatement st = con.prepareStatement(GetLocationsql);
						ResultSet resultSet = st.executeQuery();
						ResultSet rs = st.executeQuery();
					
					%>
					
					<%while(resultSet.next()){%>
					var a = document.createElement('a'); 
					var l = [];
	                var link = document.createTextNode("<%= resultSet.getString("provider_id")%>");
	                <% session.setAttribute("p_id", resultSet.getString("provider_id"));
	                session.setAttribute("r_id", session.getAttribute("uname"));
	                %>
	                a.appendChild(link); 
	                a.title = "Book this Ride"; 
	                a.href = "http://localhost:8080/MapsTest/BookRide.jsp";
	                l.push(a);
	                
					<%}%>
					for(var j = 0; j < l.length; j++){
						console.log(l[j]);
					}
					for(var j = 0; j < l.length; j++){
						var LatLng = [
							<%while(rs.next()){ %>
					        [l[j],<%=rs.getString("latitude")%>,<%=rs.getString("longitude")%>],
							<%}%>
					        ];
						<%
						
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					}
					
	  
		console.log(LatLng);
	        /*iterate on size of latitiude longitude set*/
	        for (var i = 0; i < LatLng.length; i++) {
	        new L.marker([LatLng[i][1],LatLng[i][2]])
	                .bindPopup(LatLng[i][0])
	                .addTo(map);
	        }
	        
	        map.on("click", function (e) 
	        		{ 
	        		var pt = e.latlng; //event returns lat lng of clicked point
	        		//Do your related operation here 
	        		});
	        
	});
	</script>


</body>
</html>