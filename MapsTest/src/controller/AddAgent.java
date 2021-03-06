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
}
