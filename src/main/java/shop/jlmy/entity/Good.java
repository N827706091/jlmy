package shop.jlmy.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="goods")
public class Good {
	private int id;
	private String goodName;
	//价格
	private float price;
	private ClassSecond classSecond;
	//品牌
	private String brand;
	//上市时间
	private Date upMarketDate;
	//净含量
	private float contents;
	//Specifications and types	规格类型
	private String specificationsAndTypes;
	//生产地址
	private String productionAddress;
	//expiration date	保质期
	private int  expirationDate;
	//fitskin	适合肤质
	private String fitSkin;
	//产品特性
	private String productFeature;
	//颜色
	private Set<GoodColours> goodColours=new HashSet<>(0);
	//销量
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

	@Column(name="GoodName")
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	
	@Column(name="Price")
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}

	@ManyToOne(targetEntity=ClassSecond.class,fetch=FetchType.EAGER)
	@JoinColumn(name="ClassSecond_id")
	public ClassSecond getClassSecond() {
		return classSecond;
	}
	public void setClassSecond(ClassSecond classSecond) {
		this.classSecond = classSecond;
	}
	
	@Column(name="Brand")
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Column(name="UpMarketDate")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	//@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public Date getUpMarketDate() {
		return upMarketDate;
	}
	public void setUpMarketDate(Date upMarketDate) {
		this.upMarketDate = upMarketDate;
	}
	
	@Column(name="Contents")
	public float getContents() {
		return contents;
	}
	public void setContents(float contents) {
		this.contents = contents;
	}
	
	@Column(name="SpecificationsAndTypes")
	public String getSpecificationsAndTypes() {
		return specificationsAndTypes;
	}
	public void setSpecificationsAndTypes(String specificationsAndTypes) {
		this.specificationsAndTypes = specificationsAndTypes;
	}

	@Column(name="ProductionAddress")
	public String getProductionAddress() {
		return productionAddress;
	}
	public void setProductionAddress(String productionAddress) {
		this.productionAddress = productionAddress;
	}

	@Column(name="ExpirationDate")
	public int getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(int expirationDate) {
		this.expirationDate = expirationDate;
	}

	@Column(name="FitSkin")
	public String getFitSkin() {
		return fitSkin;
	}
	public void setFitSkin(String fitSkin) {
		this.fitSkin = fitSkin;
	}
	
	@Column(name="ProductFeature")
	public String getProductFeature() {
		return productFeature;
	}
	public void setProductFeature(String productFeature) {
		this.productFeature = productFeature;
	}

	@OneToMany(targetEntity=GoodColours.class,mappedBy="good",orphanRemoval=true,fetch=FetchType.EAGER)
	@Cascade(CascadeType.ALL)
	public Set<GoodColours> getGoodColours() {
		return goodColours;
	}
	public void setGoodColours(Set<GoodColours> goodColours) {
		this.goodColours = goodColours;
	}

	@Column(name="Hot")
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
}