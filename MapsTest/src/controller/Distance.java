package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Distance {
	
	public static void main(String[] args) {
		try {
			URL url = new URL("https://apis.mapmyindia.com/advancedmaps/v1/r9qv315854csujrwdi98x3ft8ghldhp4/route_adv/biking/15.60,79.61;15.5199,80.047?");
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String strTemp = "";
			while (null != (strTemp = br.readLine())) {
				System.out.println(strTemp);
				// index = strTemp.indexOf("formatted_address");
				//System.out.println(index);
				//System.out.println(strTemp.subSequence(index+"formatted_address".length()+3, strTemp.length()-4));
			}
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
