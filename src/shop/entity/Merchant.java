package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Merchant")
public class Merchant {
	@Id
	@GeneratedValue(generator="Merchant")
	@GenericGenerator(name="Merchant",strategy="assigned")
	@Column(name="Mer_no", unique=true)
	private String Mer_no;				//商家编号
	@Column(name="Mer_name")
	private String Mer_name;			//店名
	@Column(name="Mer_legal")
	private String Mer_legal;			//法人代表
	@Column(name="Mer_address")
	private String Mer_address;			//地址
	@Column(name="Mer_phone")
	private String Mer_phone;			//联系电话
	@Column(name="Mer_email")
	private String Mer_email;			//邮箱
	@Column(name="Mer_pwd")
	private String Mer_pwd;			//邮箱
	public String getMer_no() {
		return Mer_no;
	}
	public void setMer_no(String mer_no) {
		Mer_no = mer_no;
	}
	public String getMer_name() {
		return Mer_name;
	}
	public void setMer_name(String mer_name) {
		Mer_name = mer_name;
	}
	public String getMer_legal() {
		return Mer_legal;
	}
	public void setMer_legal(String mer_legal) {
		Mer_legal = mer_legal;
	}
	public String getMer_address() {
		return Mer_address;
	}
	public void setMer_address(String mer_address) {
		Mer_address = mer_address;
	}
	public String getMer_phone() {
		return Mer_phone;
	}
	public void setMer_phone(String mer_phone) {
		Mer_phone = mer_phone;
	}
	public String getMer_email() {
		return Mer_email;
	}
	public void setMer_email(String mer_email) {
		Mer_email = mer_email;
	}
	public String getMer_pwd() {
		return Mer_pwd;
	}
	public void setMer_pwd(String mer_pwd) {
		Mer_pwd = mer_pwd;
	}
}
