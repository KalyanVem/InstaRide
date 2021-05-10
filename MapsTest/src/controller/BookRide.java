package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookRide
 */
@WebServlet("/BookRide")
public class BookRide extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_id = request.getParameter("provider_id");
		String r_id = request.getParameter("rider_id");
		System.out.println(p_id + " in bookride java");
		HttpSession session = request.getSession();
		session.setAttribute("p_id", p_id);
		response.sendRedirect("SelectVehicle.jsp");
	}
}
