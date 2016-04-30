package model;

public class PictureInfo {
	@Override
	public String toString() {
		return "PictureInfo [pictureId=" + picture_id + ", picturePath=" + picture_path + "]";
	}

	private int picture_id;
	private String picture_path;
	
	public PictureInfo(){
		this.picture_id = -1;
		this.picture_path = "";
	}
	
	public PictureInfo(int pictureId, String picturePath){
		this.picture_id = pictureId;
		this.picture_path = picturePath;
	}
	
	public int getPictureId() {
		return picture_id;
	}

	public void setPictureId(int pictureId) {
		this.picture_id = pictureId;
	}

	public String getPicturePath() {
		return picture_path;
	}

	public void setPicturePath(String picturePath) {
		this.picture_path = picturePath;
	}
}
