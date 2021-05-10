package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ApproveRideRequest")
public class ApproveRideRequest extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("uname");
		String r_id = (String)session.getAttribute("r_id");
		String v_num = (String)session.getAttribute("veh_number");
		String v_name = (String)session.getAttribute("veh_name");
		System.out.println(v_name);
		String v_model = (String)session.getAttribute("veh_model");
		boolean ar = false;
		
		try {	
			ar = AddAgent.approveRideRequest(p_id, r_id, v_name, v_num, v_model);
			System.out.println(v_num+"After inserting");
		} catch (ServletException | IOException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(ar) {
				response.sendRedirect("UpcomingProviderRides.jsp");
			}
			else {
				request.setAttribute("Invalid_creds_message", "Invalid credentials. Please check username and password or create a new account by clicking register if you are new.");
				response.sendRedirect("UpcomingProviderRides.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
