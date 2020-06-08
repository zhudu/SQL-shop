package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Sort")
public class Sort {
	@Id
	@GeneratedValue(generator="Sort")
	@GenericGenerator(name="Sort",strategy="assigned")
	@Column(name="Sor_no", unique=true)
	private String Sor_no;			//分拣号
	@Column(name="Emp_no")
	private String Emp_no;			//员工号
	@Column(name="For_no")
	private String For_no;			//订单号
	@Column(name="Sor_time")
	private String Sor_time;		//分拣时间
	@Column(name="Sor_state")
	private int Sor_state;			//分拣状态
	public String getSor_no() {
		return Sor_no;
	}
	public void setSor_no(String sor_no) {
		Sor_no = sor_no;
	}
	public String getEmp_no() {
		return Emp_no;
	}
	public void setEmp_no(String emp_no) {
		Emp_no = emp_no;
	}
	public String getFor_no() {
		return For_no;
	}
	public void setFor_no(String for_no) {
		For_no = for_no;
	}
	public String getSor_time() {
		return Sor_time;
	}
	public void setSor_time(String sor_time) {
		Sor_time = sor_time;
	}
}
