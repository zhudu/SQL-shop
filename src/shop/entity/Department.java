package shop.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Department")
public class Department {
	@Id
	@GeneratedValue(generator="Department")
	@GenericGenerator(name="Department",strategy="assigned")
	@Column(name="Dep_no", unique=true)
	private String Dep_no;				//部门号
	@Column(name="Dep_name")
	private String Dep_name;			//部门名
	@Column(name="Dep_phone")
	private String Dep_phone;			//部门电话
	public String getDep_no() {
		return Dep_no;
	}
	public void setDep_no(String dep_no) {
		Dep_no = dep_no;
	}
	public String getDep_name() {
		return Dep_name;
	}
	public void setDep_name(String dep_name) {
		Dep_name = dep_name;
	}
	public String getDep_phone() {
		return Dep_phone;
	}
	public void setDep_phone(String dep_phone) {
		Dep_phone = dep_phone;
	}
}
