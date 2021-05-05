package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
 
public class Rev {
	public static String address = "";
	public Rev() {
		try {
			URL url = new URL("https://apis.mapmyindia.com/advancedmaps/v1/r9qv315854csujrwdi98x3ft8ghldhp4/rev_geocode?lat=15.60&lng=79.61");
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String strTemp = "";
			while (null != (strTemp = br.readLine())) {
				System.out.println(strTemp);
				int index = strTemp.indexOf("formatted_address");
				System.out.println(index);
				System.out.println(strTemp.subSequence(index+"formatted_address".length()+3, strTemp.length()-4));
				address = (String) strTemp.subSequence(index+"formatted_address".length()+3, strTemp.length()-4);
			}
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}