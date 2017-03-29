package shop.jlmy.dto;

//首页图片信息
public class NavImage {
	private int goodID;
	private String type;
	private String fileName;
	private String imageHref;
	public int getGoodID() {
		return goodID;
	}
	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getImageHref() {
		return imageHref;
	}
	public void setImageHref(String imageHref) {
		this.imageHref = imageHref;
	}
}
