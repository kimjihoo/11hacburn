package model;

public class PictureInfo {
	@Override
	public String toString() {
		return "PictureInfo [pictureId=" + pictureId + ", picturePath=" + picturePath + "]";
	}

	private int pictureId;
	private String picturePath;
	
	public PictureInfo(){
		this.pictureId = -1;
		this.picturePath = "";
	}
	
	public PictureInfo(int pictureId, String picturePath){
		this.pictureId = pictureId;
		this.picturePath = picturePath;
	}
	
	public int getPictureId() {
		return pictureId;
	}

	public void setPictureId(int pictureId) {
		this.pictureId = pictureId;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
}
