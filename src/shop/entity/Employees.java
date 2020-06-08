package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Employees")
public class Employees {
	@Id
	@GeneratedValue(generator="Employees")
	@GenericGenerator(name="Employees",strategy="assigned")
	@Column(name="Emp_no", unique=true)
	private String Emp_no;			//雇员编号
	@Column(name="Emp_ID")
	private String Emp_ID;			//身份证号
	@Column(name="Emp_name")
	private String Emp_name;		//雇员名
	@Column(name="Emp_sex")
	private String Emp_sex;			//雇员性别
	@Column(name="Emp_birthday")
	private String Emp_birthday;	//生日
	@Column(name="Dep_no")
	private String Dep_no;			//部门编号
	@Column(name="Emp_pwd")
	private String Emp_pwd;			//登录密码
	public String getEmp_pwd() {
		return Emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
		Emp_pwd = emp_pwd;
	}
	public String getEmp_no() {
		return Emp_no;
	}
	public void setEmp_no(String emp_no) {
		Emp_no = emp_no;
	}
	public String getEmp_ID() {
		return Emp_ID;
	}
	public void setEmp_ID(String emp_ID) {
		Emp_ID = emp_ID;
	}
	public String getEmp_name() {
		return Emp_name;
	}
	public void setEmp_name(String emp_name) {
		Emp_name = emp_name;
	}
	public String getEmp_sex() {
		return Emp_sex;
	}
	public void setEmp_sex(String emp_sex) {
		Emp_sex = emp_sex;
	}
	public String getEmp_birthday() {
		return Emp_birthday;
	}
	public void setEmp_birthday(String emp_birthday) {
		Emp_birthday = emp_birthday;
	}
	public String getDep_no() {
		return Dep_no;
	}
	public void setDep_no(String dep_no) {
		Dep_no = dep_no;
	}
}
