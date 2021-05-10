package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddAgent")
public class AddAgent extends HttpServlet {
	static String sql = "insert into login(uname,pass,fname,lname,aadhar,mobile,email) " + "values(?,?,?,?,?,?,?)";
	
	static String providerLocationSql = "insert into provider_location(provider_id,latitude,longitude)"
			+ "values(?,?,?)";
	static String providerSql = "insert into provider(provider_id,username,password,email,age)" + "values(?,?,?,?,?)";
	static String providerAddressSql = "insert into provider_address(provider_id,address)" + "values(?,?)";
	
	static String riderLocationSql = "insert into rider_location(rider_id,latitude,longitude)"
			+ "values(?,?,?)";
	static String riderSql = "insert into rider(rider_id,username,password,email,age)" + "values(?,?,?,?,?)";
	static String riderAddressSql = "insert into rider_address(rider_id,address)" + "values(?,?)";
	
	static String addVeh = "insert into provider_veh_details(provider_id, vehname, vehno,  vehmodel)" +"values(?,?,?,?)";
	
	static String addRide = "insert into ride(provider_id, rider_id, vehicle_name, vehicle_no, vehicle_model, status) values(?,?,?,?,?,?)";
	
	static String approveRide = "update ride set status=? where provider_id=? and rider_id=? and vehicle_name=? and vehicle_no=? and vehicle_model=?";
	static String url = "jdbc:postgresql://localhost/JMaps";
	static String dbUname = "postgres";
	static String dbPass = "1234";

	public static boolean addUser(String uname, String pass, String fName, String lName, String aadhar, String mobile,
			String email) throws ServletException, IOException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pass);
			st.setString(3, fName);
			st.setString(4, lName);
			st.setString(5, aadhar);
			st.setString(6, mobile);
			st.setString(7, email);
			st.executeUpdate();
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}

	// Add Provider's location to the database
	public static boolean addProviderLocation(String uname, String lat, String longitude) throws SQLException {

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(providerLocationSql);
			st.setString(1, uname);
			st.setString(2, lat);
			st.setString(3, longitude);
			st.executeUpdate();
			System.out.println(uname + ": Updated location");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}

	// Add Provider details to the database
	public static boolean addProvider(String uname, String pass, String email, String age) throws SQLException {

		try {
			System.out.println("Trying addProvider");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(providerSql);
			st.setString(1, uname);
			st.setString(2, uname);
			st.setString(3, pass);
			st.setString(4, email);
			st.setString(5, age);
			st.executeUpdate();
			System.out.println(uname + ": Inserted in Provider table");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}

	// Add Provider's address to database
	public static boolean addProviderAddress(String uname, String address) throws SQLException {

		try {
			System.out.println("Trying addProvider");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(providerAddressSql);
			st.setString(1, uname);
			st.setString(2, address);
			st.executeUpdate();
			System.out.println(address + ": Inserted in Provider table");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	
	
	//Add Rider's Location to the database
	public static boolean addRiderLocation(String uname, String lat, String longitude) throws SQLException {

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(riderLocationSql);
			st.setString(1, uname);
			st.setString(2, lat);
			st.setString(3, longitude);
			st.executeUpdate();
			System.out.println(uname + ": Updated location");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	//Add Rider details to the database
	public static boolean addRider(String uname, String pass, String email, String age) throws SQLException {

		try {
			System.out.println("Trying addProvider");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(riderSql);
			st.setString(1, uname);
			st.setString(2, uname);
			st.setString(3, pass);
			st.setString(4, email);
			st.setString(5, age);
			st.executeUpdate();
			System.out.println(uname + ": Inserted in Provider table");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	// Add Rider's address to the database
	public static boolean addRiderAddress(String uname, String address) throws SQLException {

		try {
			System.out.println("Trying addRider");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(riderAddressSql);
			st.setString(1, uname);
			st.setString(2, address);
			st.executeUpdate();
			System.out.println(address + ": Inserted in Provider table");
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	
	public static boolean addVehicle(String uname, String vName, String vNum, String vModel) throws ServletException, IOException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(addVeh);
			st.setString(1, uname);
			st.setString(2, vName);
			st.setString(3, vNum);
			st.setString(4, vModel);
			st.executeUpdate();
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	
	public static boolean addRideRequest(String p_id, String r_id, String vName, String vNum, String vModel) throws ServletException, IOException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(addRide);
			st.setString(1, p_id);
			st.setString(2, r_id);
			st.setString(3, vNum);
			st.setString(4, vName);
			st.setString(5, vModel);
			st.setString(6, "x");
			st.executeUpdate();
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
	
	public static boolean approveRideRequest(String p_id, String r_id, String vName, String vNum, String vModel) throws ServletException, IOException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(approveRide);
			st.setString(1, "o");
			st.setString(2, p_id);
			st.setString(3, r_id);
			st.setString(4, vName);
			st.setString(5, vNum);
			st.setString(6, vModel);
			st.executeUpdate();
			System.out.println("updates "+ p_id+" "+r_id+" "+ vName);
			return true;
		} catch (ClassNotFoundException e) {
			return false;
		}
	}
}
