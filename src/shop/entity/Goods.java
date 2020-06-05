package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Goods")
public class Goods {
	@Id
	@GeneratedValue(generator="Goods")
	@GenericGenerator(name="Goods",strategy="assigned")
	@Column(name="Goo_no", unique=true)
	private String Goo_no;				//商品编码
	@Column(name="Mer_no")
	private String Mer_no;				//商家编码
	@Column(name="Goo_name")
	private String Goo_name;			//商品名
	@Column(name="Goo_price")
	private double Goo_price;			//价格
	@Column(name="Goo_detail")
	private String Goo_detail;			//商品介绍
	@Column(name="Store")
	private String Store;				//仓库编号
	public String getGoo_no() {
		return Goo_no;
	}
	public void setGoo_no(String goo_no) {
		Goo_no = goo_no;
	}
	public String getMer_no() {
		return Mer_no;
	}
	public void setMer_no(String mer_no) {
		Mer_no = mer_no;
	}
	public String getGoo_name() {
		return Goo_name;
	}
	public void setGoo_name(String goo_name) {
		Goo_name = goo_name;
	}
	public double getGoo_price() {
		return Goo_price;
	}
	public void setGoo_price(double goo_price) {
		Goo_price = goo_price;
	}
	public String getGoo_detail() {
		return Goo_detail;
	}
	public void setGoo_detail(String goo_detail) {
		Goo_detail = goo_detail;
	}
	public String getStore() {
		return Store;
	}
	public void setStore(String store) {
		Store = store;
	}
}
