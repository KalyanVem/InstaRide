package login;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.AddAgent;
import controller.Rev;


@MultipartConfig
@WebServlet("/Locate")
public class Locate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In Locate.java");
		//File
		HttpSession session = request.getSession();
	    Part filePart = request.getPart("photo"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    byte[] buffer = new byte[fileContent.available()];
	    fileContent.read(buffer);
	    File targetFile = new File("C:\\Users\\Kalyan\\Documents\\InstaRideResources\\"+(String) session.getAttribute("uname")+"_photo.jpg");
	    OutputStream outStream = new FileOutputStream(targetFile);
	    outStream.write(buffer);
	    outStream.close();
	    System.out.println(fileName);
	    
	    Part filePartAad = request.getPart("aadhar"); // Retrieves <input type="file" name="file">
	    String fileNameAad = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContentAad = filePartAad.getInputStream();
	    byte[] bufferAad = new byte[fileContentAad.available()];
	    fileContentAad.read(bufferAad);
	    File targetFileAad = new File("C:\\Users\\Kalyan\\Documents\\InstaRideResources\\"+(String) session.getAttribute("uname")+"_aadhar.jpg");
	    OutputStream outStreamAad = new FileOutputStream(targetFileAad);
	    outStreamAad.write(bufferAad);
	    outStreamAad.close();
	    System.out.println(fileNameAad);
	    
	    Part filePartLic = request.getPart("licence"); // Retrieves <input type="file" name="file">
	    String fileNameLic = Paths.get(filePartLic.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContentLic = filePartLic.getInputStream();
	    byte[] bufferLic = new byte[fileContentLic.available()];
	    fileContentLic.read(bufferLic);
	    File targetFileLic = new File("C:\\Users\\Kalyan\\Documents\\InstaRideResources\\"+(String) session.getAttribute("uname")+"_license.jpg");
	    OutputStream outStreamLic = new FileOutputStream(targetFileLic);
	    outStreamLic.write(bufferLic);
	    outStreamLic.close();
	    System.out.println(fileNameLic);
		
//		System.out.println(session.getAttribute("uname"));
//		File uploads = new File((String) session.getAttribute("uname"));
		String lat = request.getParameter("location");
		Rev rev = new Rev();
		String[] latLong = lat.split(",");
		boolean as = false, addressFlag = false;
		try {	
			as = AddAgent.addProviderLocation((String) session.getAttribute("uname"), latLong[0], latLong[1]);
			addressFlag = AddAgent.addProviderAddress((String) session.getAttribute("uname"), rev.address);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("In Locate.java, printing lats: " + lat);
		response.sendRedirect("AddVehicle.jsp");
	}

}
