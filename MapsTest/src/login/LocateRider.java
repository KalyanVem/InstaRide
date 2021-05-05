package login;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.AddAgent;
import controller.Rev;


@WebServlet("/LocateRider")
public class LocateRider extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In LocateRider.java");
		//File
		HttpSession session = request.getSession();
		
		String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	    Part filePart = request.getPart("photo"); // Retrieves <input type="file" name="file">
	    InputStream fileContent = filePart.getInputStream();
	    
	    byte[] buffer = new byte[fileContent.available()];
	    fileContent.read(buffer);
	    File targetFile = new File("C:\\Users\\Kalyan\\Documents\\InstaRideResources\\"+(String) session.getAttribute("uname")+"_photo.jpg");
	    
	    OutputStream outStream = new FileOutputStream(targetFile);
	    outStream.write(buffer);
		
//		System.out.println(session.getAttribute("uname"));
//		File uploads = new File((String) session.getAttribute("uname"));
		String lat = request.getParameter("location");
		Rev rev = new Rev();
		String[] latLong = lat.split(",");
		boolean as = false, addressFlag = false;
		try {	
			as = AddAgent.addRiderLocation((String) session.getAttribute("uname"), latLong[0], latLong[1]);
			addressFlag = AddAgent.addRiderAddress((String) session.getAttribute("uname"), rev.address);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		System.out.println("In Locate.java, printing lats: " + lat);
		response.sendRedirect("Home.jsp");
	}

}
