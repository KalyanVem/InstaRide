package login;

import java.sql.*;

public class LoginDao {
	String sql = "select * from provider where username = ? and password = ?";
	String riderSql = "select * from rider where username = ? and password = ?";
	String url = "jdbc:postgresql://localhost/JMaps";
	String username = "postgres";
	String pass = "1234";
	public boolean validateProvider(String uname, String pwd) throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			System.out.println(uname);
			st.setString(2, pwd);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean validateRider(String uname, String pwd) throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
			PreparedStatement st = con.prepareStatement(riderSql);
			st.setString(1,uname);
			System.out.println(uname);
			st.setString(2, pwd);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
