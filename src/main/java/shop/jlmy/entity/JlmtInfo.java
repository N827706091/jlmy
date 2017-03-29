package shop.jlmy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="jlmtinfo")
public class JlmtInfo {
	private int id;
	private String path;
	private Date uploadTime;
	private int hot;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Column(name="Path")
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	@Column(name="UploadTime")
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Column(name="Hot")
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	@Override
	public String toString() {
		return "JlmtInfo [id=" + id + ", path=" + path + ", uploadTime=" + uploadTime + ", hot=" + hot + "]";
	}
}
