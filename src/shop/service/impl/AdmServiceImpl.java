package shop.service.impl;


import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.Admdao;
import shop.entity.Client;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.entity.Merchant;
import shop.service.Admservice;

@Service("admservice")
public class AdmServiceImpl implements Admservice{
	
	@Autowired
	private Admdao ad;
	public Admdao getAd() {
		return ad;
	}

	public void setAd(Admdao ad) {
		this.ad = ad;
	}

	@Override
	public int useradd(Client c) {
		return ad.insert(c);
	}

	@Override
	public int userupdate(Client c) {
		return ad.update(c);
	}

	@Override
	public int empadd(Employees e) {
		return ad.insert(e);
	}

	@Override
	public int empupdate(Employees e) {
		return ad.update(e);
	}

	@Override
	public int gooadd(Goods g) {
		return ad.insert(g);
	}

	@Override
	public int gooupdate(Goods g) {
		return ad.update(g);
	}

	@Override
	public int meradd(Merchant m) {
		return ad.insert(m);
	}

	@Override
	public int merupdate(Merchant m) {
		return ad.update(m);
	}

	@Override
	public int userdelete(String id) {
		return ad.userdelete(id);
	}

	@Override
	public int empdelete(String id) {
		return ad.empdelete(id);
	}

	@Override
	public int goodelete(String id) {
		return ad.goodelete(id);
	}

	@Override
	public int merdelete(String id) {
		return ad.merdelete(id);
	}

	@Override
	public String ClientDetail(String id) {
		List<Client> c=ad.ClientDetail(id);
		Iterator<Client> it=c.iterator();
		Client client;
		StringBuffer info = new StringBuffer();
		if(it.hasNext()) {
			client=it.next();
			info.append("<div class=\"col-12\">\r\n" + 
					"<label for=\"name\" class=\"form__label\">姓名</label>\r\n" + 
					"<input id=\"name\" type=\"text\" name=\"name\" value=\""+client.getCli_name()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"phone\" class=\"form__label\">手机号</label>\r\n" + 
					"<input id=\"phone\" type=\"text\" name=\"phone\" value=\""+client.getCli_no()+"\" onBlur=\"return Client()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkphone\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Cli_id\" class=\"form__label\">身份证号</label>\r\n" + 
					"<input id=\"Cli_id\" type=\"text\" name=\"Cli_id\" value=\""+client.getCli_id()+"\" onBlur=\"return Client()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkcliid\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"password\" class=\"form__label\">密码</label>\r\n" + 
					"<input id=\"password\" type=\"text\" name=\"password\" value=\""+client.getCli_password()+"\" onBlur=\"return Client()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkclipwd\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>");
		}
		return info.toString();
	}

	@Override
	public String MerDetail(String id) {
		List<Merchant> m=ad.MerDetail(id);
		Iterator<Merchant> it=m.iterator();
		Merchant merchant;
		StringBuffer info = new StringBuffer();
		if(it.hasNext()) {
			merchant=it.next();
			info.append("<div class=\"col-12\">\r\n" + 
					"<label for=\"name\" class=\"form__label\">店名</label>\r\n" + 
					"<input id=\"name\" type=\"text\" name=\"name\" value=\""+merchant.getMer_name()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_no\" class=\"form__label\">商家编号</label>\r\n" + 
					"<input id=\"Mer_no\" type=\"text\" name=\"Mer_no\" value=\""+merchant.getMer_no()+"\" onBlur=\"return Mer()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkmerno\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_legal\" class=\"form__label\">法人代表</label>\r\n" + 
					"<input id=\"Mer_legal\" type=\"text\" name=\"Mer_legal\" value=\""+merchant.getMer_legal()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_address\" class=\"form__label\">地址</label>\r\n" + 
					"<input id=\"Mer_address\" type=\"text\" name=\"Mer_address\" value=\""+merchant.getMer_address()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_phone\" class=\"form__label\">联系电话</label>\r\n" + 
					"<input id=\"Mer_phone\" type=\"text\" name=\"Mer_phone\" value=\""+merchant.getMer_phone()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_email\" class=\"form__label\">邮箱</label>\r\n" + 
					"<input id=\"Mer_email\" type=\"text\" name=\"Mer_email\" value=\""+merchant.getMer_email()+"\" onBlur=\"return Mer()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkmeremail\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>");
		}
		return info.toString();
	}

	@Override
	public String GooDetail(String id) {
		List<Goods> c=ad.GooDetail(id);
		Iterator<Goods> it=c.iterator();
		Goods goods;
		StringBuffer info = new StringBuffer();
		if(it.hasNext()) {
			goods=it.next();
			info.append("<div class=\"col-12\">\r\n" + 
					"<label for=\"name\" class=\"form__label\">品名</label>\r\n" + 
					"<input id=\"name\" type=\"text\" name=\"name\" value=\""+goods.getGoo_name()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Goo_no\" class=\"form__label\">商品编号</label>\r\n" + 
					"<input id=\"Goo_no\" type=\"text\" name=\"Goo_no\" value=\""+goods.getGoo_no()+"\" onBlur=\"return Goo()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkgoono\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Goo_price\" class=\"form__label\">售价</label>\r\n" + 
					"<input id=\"Goo_price\" type=\"text\" name=\"Goo_price\" value=\""+goods.getGoo_price()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Store\" class=\"form__label\">仓库号</label>\r\n" + 
					"<input id=\"Store\" type=\"text\" name=\"Store\" value=\""+goods.getStore()+"\" onBlur=\"return Goo()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkstore\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Mer_no\" class=\"form__label\">商家编号</label>\r\n" + 
					"<input id=\"Mer_no\" type=\"text\" name=\"Mer_no\" value=\""+goods.getMer_no()+"\" onBlur=\"return Goo()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkmerno\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Goo_class\" class=\"form__label\">商品类别</label>\r\n" + 
					"<input id=\"Goo_class\" type=\"text\" name=\"Goo_class\" value=\""+goods.getGoo_class()+"\" class=\"form__input\">\r\n" + 
					"</div>");
		}
		return info.toString();
	}

	@Override
	public String EmpDetail(String id) {
		List<Employees> c=ad.EmpDetail(id);
		Iterator<Employees> it=c.iterator();
		Employees employees;
		StringBuffer info = new StringBuffer();
		if(it.hasNext()) {
			employees=it.next();
			info.append("<div class=\"col-12\">\r\n" + 
					"<label for=\"name\" class=\"form__label\">姓名</label>\r\n" + 
					"<input id=\"name\" type=\"text\" name=\"name\" value=\""+employees.getEmp_name()+"\" class=\"form__input\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Emp_no\" class=\"form__label\">工号</label>\r\n" + 
					"<input id=\"Emp_no\" type=\"text\" name=\"Emp_no\" value=\""+employees.getEmp_no()+"\" onBlur=\"return Emp()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkempno\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Emp_pwd\" class=\"form__label\">密码</label>\r\n" + 
					"<input id=\"Emp_pwd\" type=\"text\" name=\"Emp_pwd\" value=\""+employees.getEmp_pwd()+"\" onBlur=\"return Emp()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkpwd\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Emp_ID\" class=\"form__label\">身份证号</label>\r\n" + 
					"<input id=\"Emp_ID\" type=\"text\" name=\"Emp_ID\" value=\""+employees.getEmp_ID()+"\" onBlur=\"return Emp()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkID\" style=\"color:#fa7268\"></span>\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"col-12\">\r\n" + 
					"<label for=\"Dep_no\" class=\"form__label\">部门号</label>\r\n" + 
					"<input id=\"Dep_no\" type=\"text\" name=\"Dep_no\" value=\""+employees.getDep_no()+"\" onBlur=\"return Emp()\" class=\"form__input\">\r\n" + 
					"<span id=\"checkdepno\" style=\"color:#fa7268\"></span>\r\n</div>");
		}
		return info.toString();
	}


}
