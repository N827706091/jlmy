package shop.jlmy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="wxorder")
public class WxOrder {
	private Integer id;
	private Integer orderId;
	private String openId;
	private Integer goodId;
	private String goodName;
	private String colourName;
	private Integer goodCount;
	//商品价格
	private float goodPrice;
	//支付金额
	private float realPay;
	//快递
	private long express;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="OrderId")
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name="OpenId")
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}

	@Column(name="GoodId")
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	@Column(name="GoodName")
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	@Column(name="ColourName")
	public String getColourName() {
		return colourName;
	}
	public void setColourName(String colourName) {
		this.colourName = colourName;
	}

	@Column(name="GoodCount")
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}

	@Column(name="GoodPrice")
	public float getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(float goodPrice) {
		this.goodPrice = goodPrice;
	}

	@Column(name="RealPay")
	public float getRealPay() {
		return realPay;
	}
	public void setRealPay(float realPay) {
		this.realPay = realPay;
	}

	@Column(name="Express")
	public long getExpress() {
		return express;
	}
	public void setExpress(long express) {
		this.express = express;
	}
}