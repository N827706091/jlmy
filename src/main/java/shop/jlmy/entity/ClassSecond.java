package shop.jlmy.entity;

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

@Entity
@Table(name="classsecond")
public class ClassSecond {
	private int id;
	private String className;
	//分类描述
	private String description;

	private ClassFirst classFirst;
	
	private Set<Good> goods=new HashSet<>(0);

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Column(name="ClassName")
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}

	@Column(name="Description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne(targetEntity=ClassFirst.class,fetch=FetchType.LAZY)
	@JoinColumn(name="ClassFirst_id")
	public ClassFirst getClassFirst() {
		return classFirst;
	}
	public void setClassFirst(ClassFirst classFirst) {
		this.classFirst = classFirst;
	}

	@OneToMany(targetEntity=Good.class,mappedBy="classSecond",orphanRemoval=false,fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	public Set<Good> getGoods() {
		return goods;
	}
	public void setGoods(Set<Good> goods) {
		this.goods = goods;
	}
}
