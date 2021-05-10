package controller;

public class LocatePojo {
	private String uName;
    private String lat;
    private String lon;
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
    
	@Override
    public String toString()
    {
        return "Location {UserName="
            + uName
            + ", lat="
            + lat
            + ", lon="
            + lon + "}";
    }
}
