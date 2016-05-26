package model;

public class BookmarkInfo {
	
	private int bookmark_id;
	private int user_id;
	private int company_id;

	public BookmarkInfo(){
		bookmark_id = -1;
		user_id = -1;
		company_id = -1;
	}
	
	public BookmarkInfo(int bookmark_id, int user_id, int company_id){
		this.bookmark_id = bookmark_id;
		this.user_id = user_id;
		this.company_id = company_id;
	}

	public int getBookmark_id() {
		return bookmark_id;
	}

	public void setBookmark_id(int bookmark_id) {
		this.bookmark_id = bookmark_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
}
