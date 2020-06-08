package shop.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Delivery")
public class Delivery {
	@Id
	@GeneratedValue(generator="Delivery")
	@GenericGenerator(name="Delivery",strategy="assigned")
	@Column(name="Del_no", unique=true)
	private String Del_no;		//配送号
	@Column(name="Sor_no")
	private String Sor_no;		//分拣号
	@Column(name="Emp_no")
	private String Emp_no;		//员工编号
	@Column(name="Add_no")
	private String Add_no;		//收货号
	@Column(name="Del_gotime")
	private String Del_gotime;		//配送时间
	@Column(name="Del_gettime")
	private String Del_gettime;		//签收时间
	@Column(name="Del_voucher")
	private int Del_voucher;		//签收状态
	@Column(name="Del_status")
	private int Del_status;			//配送状态
	public String getDel_no() {
		return Del_no;
	}
	public void setDel_no(String del_no) {
		Del_no = del_no;
	}
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
	public String getAdd_no() {
		return Add_no;
	}
	public void setAdd_no(String add_no) {
		Add_no = add_no;
	}
	public String getDel_gotime() {
		return Del_gotime;
	}
	public void setDel_gotime(String del_gotime) {
		Del_gotime = del_gotime;
	}
	public String getDel_gettime() {
		return Del_gettime;
	}
	public void setDel_gettime(String del_gettime) {
		Del_gettime = del_gettime;
	}
	public int getDel_voucher() {
		return Del_voucher;
	}
	public void setDel_voucher(int del_voucher) {
		Del_voucher = del_voucher;
	}
	public int getDel_status() {
		return Del_status;
	}
	public void setDel_status(int del_status) {
		Del_status = del_status;
	}
}
