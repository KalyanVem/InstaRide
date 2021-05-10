<!DOCTYPE html>
<html>
<head>
	<!--browser-sync start --server --directory --files "**/*"-->
	<meta charset="utf-8">

	<!-- tells some ie to use latest rendering versions -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial=scaile=1">
	
	<title>Sign Up Rider</title>

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
			padding-left: 0;
			border-top-left-radius: 10px;
			border-bottom-left-radius: 10px; 
			padding-top: 10vh;
			padding-left: 10vw;	
			color: white;
		}
		#signup-form{
			width: 80vw;
			margin: auto;
			margin-top: 15vh;
			margin-bottom: 15vh;
			border-radius: 10px;
			border-color: darkslategray;
			box-shadow: 15px 20px 20px darkslategrey;
			background-color: #056594;
		}
		#main-content{
			padding: 8vh;
			border-top-right-radius: 10px;
			border-bottom-right-radius: 10px; 
			position: relative;
			background-color: lightslategray;
			height: inherit;
			/*padding-left: 8%;	*/
		}
		.lbl{
			float: left;
			clear: both;
			width: 86%;
			margin-top: 5px;
			margin-bottom: 10px;
			color: black;
		}
		input{
			border-radius: 10px;
			border : 1px solid #ccc;
			margin-bottom: 10px;
			padding: 10px 5px;
			width: 100%;
		}
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		button{
			margin: 10px 12px;
			height: 40px;
			border-radius: 10px;
			border : 1px solid #ccc;
		}
		#main-content a{
			color: white;
			text-decoration: none;
		}
		#main-content a:hover{
			color: #056594;
		}
		hr{
			width: 100%;
		}
		#brand-sm{
			color: white;
		    background-color: #056594;
		    border-radius: 10px;
		    margin-bottom: 25px;
		    padding: 15px;
		    text-align: center;
		    /*margin: 20px;*/
		    width: 100%;
		}
		@media(max-width: 992px) and (min-width: 400px){
			#main-content{		
			border-radius:10px;	
			}
		}	
		
	</style>
</head>
<body>
	<form method="post" action="LocateRider" enctype="multipart/form-data" id="signup-form" class="row">
		<div id="side" class="col-md-6 visible-md visible-lg">
			<h1>InstaRide</h1>
			<span>Sign Up - Rider</span>
		</div>
		<div class="col-md-6" id="main-content">
			<div class="col-md-6 visible-sm visible-xs" id="brand-sm">
				<h1>InstaRide</h1>
				<span>SignUp - Rider</span>
			</div>

			
			<label class="lbl">Upload Passport-sized Photo:</label>
				<p><input type="file" id="myFile" name="photo" ></p>
			<label class="lbl">Upload Licence:</label>
				<p><input type="file" id="myFile" name="licence" ></p>
			<label class="lbl">Upload Aadhar:</label>
				<p><input type="file" id="myFile" name="aadhar" ></p>
				<p type="hidden">
			Your location is <span id="latitude">0.00</span>° latitude by <span
				id="longitude">0.00</span>° longitude.
		</p>

			<!-- update location -->
			<input type="hidden" name="location" id="location" />
			<button class="col-md-12" id="get-location" type="button">Update Location</button>

			<div >
				<button class="col-md-5" type="submit"><span class="glyphicon glyphicon-log-in"></span> SignUp</button>
				<button class="col-md-5"  type="reset"><span class="glyphicon glyphicon-repeat"></span> Clear</button>
				
			</div>
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
			<hr >
			<p >
				<span>Already have an account ?</span>
				<b><a href="LoginRider.jsp">Login</a><b>
			</p>
		</div>
	</form>

<!-- jQuery (Bootstrap JS plugins depend on it) -->
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>