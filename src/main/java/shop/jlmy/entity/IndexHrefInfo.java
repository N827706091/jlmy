package shop.jlmy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="indexhrefinfo")
public class IndexHrefInfo {
	private Integer id;
	private String imageName;
	private String path;
	private String href;
	private int areaID;
	private Date uploadTime;

	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="ImageName")
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	@Column(name="Path")
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	@Column(name="Href")
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}

	@Column(name="AreaID")
	public int getAreaID() {
		return areaID;
	}
	public void setAreaID(int areaID) {
		this.areaID = areaID;
	}

	@Column(name="UploadTime")
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "IndexHrefInfo [id=" + id + ", imageName=" + imageName + ", path=" + path + ", href=" + href
				+ ", areaID=" + areaID + ", uploadTime=" + uploadTime + "]";
	}
	
}
