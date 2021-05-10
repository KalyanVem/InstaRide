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

@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vName = request.getParameter("vName");
		String vNum = request.getParameter("vNum");
		String vModel = request.getParameter("vModel");
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("uname");
		boolean as = false, proUserFlag=false, proLocFlag=false;
		try {	
			as = AddAgent.addVehicle(uname, vName, vNum, vModel);
		} catch (ServletException | IOException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(as) {
				response.sendRedirect("Home.jsp");
			}
			else {
				request.setAttribute("Invalid_creds_message", "Invalid credentials. Please check username and password or create a new account by clicking register if you are new.");
				response.sendRedirect("AddVehicle.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
