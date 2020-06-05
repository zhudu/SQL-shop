package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Cart")
public class Cart {
	@Id
	@GeneratedValue(generator="Cart")
	@GenericGenerator(name="Cart",strategy="assigned")
	@Column(name="Goo_no", unique=false)
	private String Goo_no;			//商品条码
	@Column(name="Cart_num")
	private String Cart_num;		//数量
	@Column(name="Cli_no")
	private String Cli_no;			//顾客编码
	public String getGoo_no() {
		return Goo_no;
	}
	public void setGoo_no(String goo_no) {
		Goo_no = goo_no;
	}
	public String getCart_num() {
		return Cart_num;
	}
	public void setCart_num(String cart_num) {
		Cart_num = cart_num;
	}
	public String getCli_no() {
		return Cli_no;
	}
	public void setCli_no(String cli_no) {
		Cli_no = cli_no;
	}
}
