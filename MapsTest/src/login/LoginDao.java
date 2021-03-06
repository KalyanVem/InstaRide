package login;

import java.sql.*;

public class LoginDao {
	String sql = "select * from login where uname = ? and pass = ?";
	String url = "jdbc:postgresql://localhost/JMaps";
	String username = "postgres";
	String pass = "1234";
	public boolean validate(String uname, String pwd) throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
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
