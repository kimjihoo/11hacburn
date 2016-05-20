package model;

public class UserInfo {
	
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_region_1;
	private String user_region_2;
	private String user_region_3;
	private String user_phone;
	private String user_bicycletype;
	private int user_emailpush;
	private String user_lat;
	private String user_lng;
	
	public UserInfo(){
		this.user_id = -1;
		this.user_name="";
		this.user_email="";
		this.user_password="";
		this.user_region_1="";
		this.user_region_2="";
		this.user_region_3="";
		this.user_phone="";
		this.user_bicycletype="";
		this.user_emailpush=0;
		this.user_lat = "";
		this.user_lng = "";
	}
	
	public UserInfo(int user_id, String user_name, String user_email, String user_password, String user_region_1, String user_region_2, String user_region_3, String user_phone, String user_bicycletype, int user_emailpush, String user_lat, String user_lng){
		this.user_id = user_id;
		this.user_name=user_name;
		this.user_email=user_email;
		this.user_password=user_password;
		this.user_region_1 = user_region_1;
		this.user_region_2=user_region_2;
		this.user_region_3=user_region_3;
		this.user_phone=user_phone;
		this.user_bicycletype=user_bicycletype;
		this.user_emailpush=user_emailpush;
		this.user_lat = user_lat;
		this.user_lng = user_lng;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public String getUser_region_1() {
		return user_region_1;
	}

	public void setUser_region_1(String user_region_1) {
		this.user_region_2 = user_region_1;
	}

	public String getUser_region_2() {
		return user_region_2;
	}

	public void setUser_region_2(String user_region_2) {
		this.user_region_2 = user_region_2;
	}
	
	public String getUser_region_3() {
		return user_region_3;
	}

	public void setUser_region_3(String user_region_3) {
		this.user_region_3 = user_region_3;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_bicycletype() {
		return user_bicycletype;
	}

	public void setUser_bicycletype(String user_bicycletype) {
		this.user_bicycletype = user_bicycletype;
	}

	public int getUser_emailpush() {
		return user_emailpush;
	}

	public void setUser_emailpush(int user_emailpush) {
		this.user_emailpush = user_emailpush;
	}

	public String getUser_lat() {
		return user_lat;
	}

	public void setUser_lat(String user_lat) {
		this.user_lat = user_lat;
	}
	
	public String getUser_lng() {
		return user_lng;
	}

	public void setUser_lng(String user_lng) {
		this.user_lng = user_lng;
	}

}
