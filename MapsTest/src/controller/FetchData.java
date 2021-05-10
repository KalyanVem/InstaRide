package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;


public class FetchData {
	static String GetLocationsql = "select * from provider_location";
	static String getAadhar = "select aadhar from login where uname=?";
	static String GetAddressRider = "select * from rider_address where rider_id=?";
	
	static String url = "jdbc:postgresql://localhost/JMaps";
	static String dbUname = "postgres";
	static String dbPass = "1234";
	
	
	public static String getLocation() throws IOException, SQLException {
		ArrayList<ArrayList<String>> location_array = new ArrayList<>();
		Gson gson = new Gson();
		String s ="";
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(GetLocationsql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ArrayList<String> temp = new ArrayList<>();
				temp.add(rs.getString("provider_id"));
				temp.add(rs.getString("latitude"));
				temp.add(rs.getString("longitude"));
				location_array.add(temp);
			}
			for(ArrayList a : location_array) {
				//for(int i = 0; i < 3; i++)
					//System.out.println(a.get(i));
				//System.out.println("--------------------");
			}
			System.out.println(gson.toJson(location_array));
			s = gson.toJson(gson.toJson(location_array));
			return s;		
		} catch (ClassNotFoundException e) {
			return s;
		}
	}
	
	
	public static Profile getRiderAddress(String rider_id) throws IOException, SQLException {
		Gson gson = new Gson();
		String s ="";
		Profile p = new Profile();
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUname, dbPass);
			PreparedStatement st = con.prepareStatement(GetAddressRider);
			st.setString(1, rider_id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				p.setName(rs.getString("rider_id"));
				p.setAddress(rs.getString("address"));
			}
			PreparedStatement stmt = con.prepareStatement(getAadhar);
			stmt.setString(1, rider_id);
			ResultSet rset = stmt.executeQuery();
			while(rset.next()) {
				p.setAadhar(rset.getString("aadhar"));
			}
		} catch (ClassNotFoundException e) {
			return p;
		}
		return p;
	}
}
