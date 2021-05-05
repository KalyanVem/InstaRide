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
	static String sql = "insert into login(uname,pass,fname,lname,aadhar,mobile,email) " + 
			"values(?,?,?,?,?,?,?)";
	static String providerLocationSql = "insert into provider_location(provider_id,latitude,longitude)"+
			"values(?,?,?)";
	static String providerSql = "insert into provider(provider_id,username,password,email,age)"+
			"values(?,?,?,?,?)";
	static String providerAddressSql = "insert into provider_address(provider_id,address)"+
			"values(?,?)";
	static String url = "jdbc:postgresql://localhost/JMaps";
	static String dbUname = "postgres";
	static String dbPass = "1234";
	public static boolean addUser(String uname, String pass, String fName, String lName, String aadhar, String mobile, String email) throws ServletException, IOException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2, pass);
			st.setString(3,fName);
			st.setString(4, lName);
			st.setString(5,aadhar);
			st.setString(6, mobile);
			st.setString(7,email);
			st.executeUpdate();
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return false;
		}
	}
	
	public static boolean addProviderLocation(String uname, String lat, String longitude) throws SQLException {
		
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(providerLocationSql);
			st.setString(1,uname);
			st.setString(2, lat);
			st.setString(3,longitude);
			st.executeUpdate();
			System.out.println(uname+": Updated location");
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return false;
		}
	}
	
public static boolean addProvider(String uname, String pass, String email, String age) throws SQLException {
		
		try {
			System.out.println("Trying addProvider");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(providerSql);
			st.setString(1,uname);
			st.setString(2, uname);
			st.setString(3,pass);
			st.setString(4,email);
			st.setString(5,age);
			st.executeUpdate();
			System.out.println(uname+": Inserted in Provider table");
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return false;
		}
	}

public static boolean addProviderAddress(String uname, String address) throws SQLException {
	
	try {
		System.out.println("Trying addProvider");
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(url, dbUname, dbPass);
		PreparedStatement st = con.prepareStatement(providerAddressSql);
		st.setString(1, uname);
		st.setString(2,address);
		st.executeUpdate();
		System.out.println(address+": Inserted in Provider table");
		return true;
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		return false;
	}
}
}
