package model;

import java.sql.Date;

public class ApplicationInfo {
	private int tunning_id;
	private int user_id;
	private String tunning_title;
	private String tunning_explanation;
	private int tunning_firm;
	private Date upload_date;

	public ApplicationInfo(){
		tunning_id=-1;
		user_id=-1;
		tunning_explanation="";
		tunning_firm=-1;
		upload_date=new Date(0000-00-00);
	}
	
	public ApplicationInfo(int tunning_id, int user_id, String tunning_title, String tunning_explanation, int tunning_firm, Date upload_date){
		this.tunning_id = tunning_id;
		this.user_id = user_id;
		this.tunning_title = tunning_title;
		this.tunning_explanation = tunning_explanation;
		this.tunning_firm = tunning_firm;
		this.upload_date = upload_date;
	}
	public ApplicationInfo(int tunning_id, int user_id, String tunning_title, String tunning_explanation, int tunning_firm){
		this.tunning_id = tunning_id;
		this.user_id = user_id;
		this.tunning_title = tunning_title;
		this.tunning_explanation = tunning_explanation;
		this.tunning_firm = tunning_firm;
	}
	public ApplicationInfo(int tunning_id, String tunning_title, Date upload_date){
		this.tunning_id = tunning_id;
		this.tunning_title = tunning_title;
		this.upload_date = upload_date;
	}
	public ApplicationInfo(int tunning_id, String tunning_title, String tunning_explanation, Date upload_date){
		this.tunning_id = tunning_id;
		this.tunning_title = tunning_title;
		this.tunning_explanation = tunning_explanation;
		this.upload_date = upload_date;
	}

	public int getTunning_id() {
		return tunning_id;
	}

	public void setTunning_id(int tunning_id) {
		this.tunning_id = tunning_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getTunning_title(){
		return tunning_title;
	}
	
	public void setTunning_title(String tunning_title){
		this.tunning_title = tunning_title;
	}

	public String getTunning_explanation() {
		return tunning_explanation;
	}

	public void setTunning_explanation(String tunning_explanation) {
		this.tunning_explanation = tunning_explanation;
	}

	public int getTunning_firm() {
		return tunning_firm;
	}

	public void setTunning_firm(int tunning_firm) {
		this.tunning_firm = tunning_firm;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
}