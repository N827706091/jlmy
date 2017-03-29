package shop.jlmy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="goodcolours")
public class GoodColours {
	private int id;
	private String colourName;
	//库存
	private int inventory;
	private Good good;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Column(name="ColourName")
	public String getColourName() {
		return colourName;
	}
	public void setColourName(String colourName) {
		this.colourName = colourName;
	}

	@Column(name="Inventory")
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	@ManyToOne(targetEntity=Good.class,fetch=FetchType.EAGER)
	@JoinColumn(name="Good_id")
	public Good getGood() {
		return good;
	}
	public void setGood(Good good) {
		this.good = good;
	}
}
