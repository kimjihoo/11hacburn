package model;

import java.sql.Date;

public class MemberInfo {
	private int company_id;
	private String company_ownername;
	private String company_email;
	private String company_password;
	private String company_name;
	private String company_region;
	private int company_telephone;
	private int company_phone;
	private	int company_approval;
	private Date company_approvaldate;
	private String company_photo;
	private int company_emailpush;
	
	public MemberInfo(){
		this.company_id=-1;
		this.company_ownername="";
		this.company_email="";
		this.company_password="";
		this.company_name="";
		this.company_region="";
		this.company_telephone=-1;
		this.company_phone=-1;
		this.company_approval=-1;
		this.company_approvaldate = new Date(0000-00-00);
		this.company_photo="";
		this.company_emailpush=-1;
	}
	
	public MemberInfo(int company_id, String company_ownername, String company_email, String company_password, String company_name, String company_region, int company_telephone, int company_phone, int company_approval, Date company_approvaldate, String company_photo, int company_emailpush){
		this.company_id=company_id;
		this.company_ownername=company_ownername;
		this.company_email=company_email;
		this.company_password=company_password;
		this.company_name=company_name;
		this.company_region=company_region;
		this.company_telephone=company_telephone;
		this.company_phone=company_phone;
		this.company_approval=company_approval;
		this.company_approvaldate = company_approvaldate;
		this.company_photo=company_photo;
		this.company_emailpush = company_emailpush;
	}
	
	public MemberInfo(int company_id, String company_ownername, String company_email, String company_password, String company_name, String company_region, int company_telephone, int company_phone, int company_approval, int company_emailpush){
		this.company_id=company_id;
		this.company_ownername=company_ownername;
		this.company_email=company_email;
		this.company_password=company_password;
		this.company_name=company_name;
		this.company_region=company_region;
		this.company_telephone=company_telephone;
		this.company_phone=company_phone;
		this.company_approval=company_approval;
		this.company_emailpush = company_emailpush;
	}
	
	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getCompany_ownername() {
		return company_ownername;
	}

	public void setCompany_ownername(String company_ownername) {
		this.company_ownername = company_ownername;
	}

	public String getCompany_email() {
		return company_email;
	}

	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}

	public String getCompany_password() {
		return company_password;
	}

	public void setCompany_password(String company_password) {
		this.company_password = company_password;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_region() {
		return company_region;
	}

	public void setCompany_region(String company_region) {
		this.company_region = company_region;
	}

	public int getCompany_telephone() {
		return company_telephone;
	}

	public void setCompany_telephone(int company_telephone) {
		this.company_telephone = company_telephone;
	}

	public int getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(int company_phone) {
		this.company_phone = company_phone;
	}

	public int getCompany_approval() {
		return company_approval;
	}

	public void setCompany_approval(int company_approval) {
		this.company_approval = company_approval;
	}
	
	public Date getCompany_approvaldate() {
		return company_approvaldate;
	}

	public void setCompany_approvaldate(Date company_approvaldate) {
		this.company_approvaldate = company_approvaldate;
	}

	public String getCompany_photo() {
		return company_photo;
	}

	public void setCompany_photo(String company_photo) {
		this.company_photo = company_photo;
	}
	public int getCompany_emailpush() {
		return company_emailpush;
	}

	public void setCompany_emailpush(int company_emailpush) {
		this.company_emailpush = company_emailpush;
	}
	
}
