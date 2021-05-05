<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Location test</title>


</head>
<body>
	<form method="post" action="LocateRider" enctype="multipart/form-data">
	
		<input type="text" name="description" />
   		<input type="file" name="photo" />
    	<button type="button" value="Upload">Upload</button>
    	
    	<input type="text" name="description" />
   		<input type="file" name="aadhar" />
    	<button type="button" value="Upload">Upload</button>
    	
    	<input type="text" name="description" />
   		<input type="file" name="licence" />
    	<button type="button" value="Upload">Upload</button>
		<p>
			Your location is <span id="latitude">0.00</span>° latitude by <span
				id="longitude">0.00</span>° longitude.
		</p>
		<% out.println(session.getAttribute("uname"));
			session.setAttribute("uname", session.getAttribute("uname"));
		%>
		<input type="hidden" name="location" id="location" /> 
		<button id="get-location" type="button" >Get My Location</button>
		<button type="submit" value="Next">Next</button>
		
			<script type="text/javascript">
			let button = document.getElementById("get-location");
			let latText = document.getElementById("latitude");
			let longText = document.getElementById("longitude");
		
			button.addEventListener("click", function() {
			  navigator.geolocation.getCurrentPosition(function(position) {
			    let lat = position.coords.latitude;
			    let long = position.coords.longitude;
		
			    latText.innerText = lat.toFixed(2);
			    longText.innerText = long.toFixed(2);
			    
			    var latLong = [];
			    latLong.push(position.coords.latitude);
			    latLong.push(position.coords.longitude);
			    
			    var hiddenLocation = document.getElementById("location");
			    hiddenLocation.value = latLong.join(",");
			    document.getElementById("location").value = hiddenLocation.value;
			    console.log( hiddenLocation.value);
			    console.log(typeof hiddenLocation.value);
			    var locat = hiddenLocation.value;
			  });
			});
      
      </script>
	</form>

</body>
</html>