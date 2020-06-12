package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Form")
public class Form {
	@Id
	@GeneratedValue(generator="Form")
	@GenericGenerator(name="Form",strategy="assigned")
	@Column(name="For_no", unique=true)
	private String For_no;			//订单号
	@Column(name="Cli_no")
	private String Cli_no;			//顾客编码
	@Column(name="Goo_no")
	private String Goo_no;			//商品编号
	@Column(name="For_num")
	private int For_num;			//数量
	@Column(name="For_time")
	private String For_time;		//下单时间
	@Column(name="For_pay")
	private int For_pay;			//支付状态
	public String getFor_no() {
		return For_no;
	}
	public void setFor_no(String for_no) {
		For_no = for_no;
	}
	public String getCli_no() {
		return Cli_no;
	}
	public void setCli_no(String cli_no) {
		Cli_no = cli_no;
	}
	public String getGoo_no() {
		return Goo_no;
	}
	public void setGoo_no(String goo_no) {
		Goo_no = goo_no;
	}
	public int getFor_num() {
		return For_num;
	}
	public void setFor_num(int for_num) {
		For_num = for_num;
	}
	public String getFor_time() {
		return For_time;
	}
	public void setFor_time(String for_time) {
		For_time = for_time;
	}
	public int getFor_pay() {
		return For_pay;
	}
	public void setFor_pay(int for_pay) {
		For_pay = for_pay;
	}
}
