package login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.AddAgent;

@WebServlet("/Register")
public class Register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String aadhar = request.getParameter("aadhar");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String repass = request.getParameter("repass");
		String longLat = request.getParameter("pk");
		System.out.println(longLat);
		boolean as = false, proUserFlag=false, proLocFlag=false;
		try {	
			as = AddAgent.addUser(username, repass, fName, lName, aadhar, mobile, email);
			proUserFlag = AddAgent.addProvider(username, repass, email, "AGE");
		} catch (ServletException | IOException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(as && proUserFlag) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", username);
				response.sendRedirect("Locate.jsp");
			}
			else {
				request.setAttribute("Invalid_creds_message", "Invalid credentials. Please check username and password or create a new account by clicking register if you are new.");
				response.sendRedirect("Register.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
