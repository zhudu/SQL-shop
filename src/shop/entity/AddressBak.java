package shop.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="AddressBak")
public class AddressBak {
	@Id
	@GeneratedValue(generator="Addres")
	@GenericGenerator(name="Addres",strategy="assigned")
	@Column(name="Add_no", unique=true)
	private String Add_no;		//收货号
	@Column(name="Add_name")
	private String Add_name;		//收货人
	@Column(name="Add_detail")
	private String Add_detail;		//收货地址
	@Column(name="Add_phone")
	private String Add_phone;		//联系电话
	@Column(name="Cli_no")
	private String Cli_no;			//顾客编号
	public String getAdd_no() {
		return Add_no;
	}
	public void setAdd_no(String add_no) {
		Add_no = add_no;
	}
	public String getAdd_name() {
		return Add_name;
	}
	public void setAdd_name(String add_name) {
		Add_name = add_name;
	}
	public String getAdd_detail() {
		return Add_detail;
	}
	public void setAdd_detail(String add_detail) {
		Add_detail = add_detail;
	}
	public String getAdd_phone() {
		return Add_phone;
	}
	public void setAdd_phone(String add_phone) {
		Add_phone = add_phone;
	}
	public String getCli_no() {
		return Cli_no;
	}
	public void setCli_no(String cli_no) {
		Cli_no = cli_no;
	}
}
