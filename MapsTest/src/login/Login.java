package login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uname");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		LoginDao dao = new LoginDao();
		try {
			if (!(username == "")) {
				if (dao.validate(username, pass)) {
					session = request.getSession();
					session.setAttribute("uname", username);
					response.sendRedirect("Home.jsp");
				} else {
					request.setAttribute("Invalid_creds_message",
							"Invalid credentials. Please check username and password or create a new account by clicking register if you are new.");
					response.sendRedirect("Login.jsp");
				}
			}
			else {
				response.sendRedirect("Login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
