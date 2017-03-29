package shop.jlmy.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="classfirst")
public class ClassFirst {
	private int id;
	private String className;
	//分类描述
	private String description;
	private Set<ClassSecond> classSeconds=new HashSet<>(0);
	
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

	//@Column(name="ClassSeconds")
	@OneToMany(targetEntity=ClassSecond.class,mappedBy="classFirst",fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@Cascade(CascadeType.SAVE_UPDATE)
	public Set<ClassSecond> getClassSeconds() {
		return classSeconds;
	}
	public void setClassSeconds(Set<ClassSecond> classSeconds) {
		this.classSeconds = classSeconds;
	}
}