package shop.service.impl;


import java.util.Iterator;
import java.util.List;

import org.apache.derby.catalog.types.UDTAliasInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.messaging.saaj.soap.ver1_1.Envelope1_1Impl;

import shop.dao.Empdao;
import shop.entity.*;
import shop.service.Empservice;

@Service("empservice")
public class EmpServiceImpl implements Empservice{
	@Autowired
	private Empdao ed;
	
	public Empdao getEd() {
		return ed;
	}

	public void setEd(Empdao ed) {
		this.ed = ed;
	}

	@Override
	public MerchantDetail merlogin(Merchant m) {
		MerchantDetail md=new MerchantDetail();
		md.setI(0);
		String info;
		List<Merchant> rs=ed.merlogin(m);
		Iterator<Merchant> it=rs.iterator();
		Merchant m1=new Merchant();
		if(it.hasNext()) {
			m1=it.next();
		}
		String mer_no=m1.getMer_no();
		if(mer_no!=null) {
			info=Mer2Goods(m);
			md.setI(1);
			md.setInfo(info);
			md.setM(m1);
		}
		return md;
	}

	@Override
	public empjob login(Employees e) {
		empjob ej=new empjob();
		List<Employees> rs=ed.login(e);
		Iterator<Employees> it=rs.iterator();
		Employees el=new Employees();
		if(it.hasNext()) {
			el=it.next();
		}
		String dep_no=el.getDep_no();
		System.out.println(dep_no);
		if(dep_no!=null) {
			if(dep_no.equals("1101")) {
				System.out.println("1101");
				String info=job1(e);
				ej.setI(1);
				ej.setInfo(info);
				ej.setE(el);
				return ej;
			}else if (dep_no.equals("1102")) {
				System.out.println("1102");
				String info = job2(e);
				ej.setI(1);
				ej.setInfo(info);
				ej.setE(el);
				return ej;
			}else if (dep_no.equals("1111")) {
				System.out.println("1111");
				String info = job3();
				ej.setI(2);
				ej.setInfo(info);
				ej.setE(el);
				return ej;
			}
		}
		return ej;
	}

	@Override
	public int delivery(Delivery d) {
		return ed.delivery(d);
	}

	@Override
	public int delivery1(Delivery d) {
		return ed.delivery1(d);
	}

	@Override
	public int sort(Sort s) {
		return ed.sort(s);
	}

	@Override
	public int register(Employees e) {
		if (ed.empcheck(e)==0) {		//账号不存在才创建
			return ed.register(e);
		}else {
			return 0;
		}
	}

	@Override
	public int register(Merchant m) {
		if (ed.mercheck(m)==0) {		//账号不存在才创建
			return ed.register(m);
		}else {
			return 0;
		}
	}

	@Override
	public int forget(Employees e) {
		return ed.forget(e);
	}

	@Override
	public int forget(Merchant m) {
		return ed.forget(m);
	}

	private String Mer2Goods(Merchant m) {
		List<Goods> goods=ed.Mer2Goods(m);
		Iterator<Goods> it=goods.iterator();
		Goods g;
		StringBuffer info=new StringBuffer();
		info.append("<thead>\r\n<tr>\r\n<th>商品条码</th>\r\n<th>品名</th>\r\n<th>售价</th>\r\n" + 
				"<th>仓库号</th>\r\n<th>类别</th>\r\n<th><a href=\"../admin/Gooadd.jsp\"><button type=\"button\">"
				+ "<i class=\"lnr lnr-users\"/></button></a></th>\r\n</tr>\r\n</thead><tbody>");
		while(it.hasNext()) {
			g=it.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+g.getGoo_no()+"</a></td>\r\n<td>"+g.getGoo_name()+"</td>\r\n<td>"+g.getGoo_price()+"</td>\r\n" + 
					"<td>"+g.getStore()+"</td><td>"+g.getGoo_class()+"</td>\r\n<th>\r\n" + 
					"<a href=\"../admcontrol?function=goo_update&id="+g.getGoo_no()+"\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"../admcontrol?function=goodelete&id="+g.getGoo_no()+"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
					"</th>\r\n</tr>");
		}
		info.append("</tbody>");
		return info.toString();
	}

	@Override
	public String job1(Employees e) {
		List del=ed.SearchDelivery(e);
		Iterator<Delivery> it=del.iterator();
		Delivery d;
		AddressBak a;
		StringBuffer info = new StringBuffer();
		info.append("<thead>\r\n<tr>\r\n<th>配送号</th>\r\n<th>收货地址</th>\r\n<th>收件人号码</th>\r\n<th>配送时间</th>\r\n" + 
				"<th>送达时间</th>\r\n<th>状态</th>\r\n<th></th>\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		while(it.hasNext()) {
			d=it.next();
			List<AddressBak> addres=ed.Searchaddres(d);
			Iterator<AddressBak> it1=addres.iterator();
			a=it1.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+d.getDel_no()+"</a></td>\r\n<td>"+a.getAdd_detail()+"</td>\r\n" + 
					"<td>"+a.getAdd_phone()+"</td>\r\n<td>"+d.getDel_gotime()+"</td>\r\n");
			if(d.getDel_status()!=2) {
				info.append("<td>----:--:--</td>");
			}else {
				info.append("<td>"+d.getDel_gettime()+"</td>");
			}
			if(d.getDel_status()==0) {
				info.append("<td>待配送</td>\r\n<td><form action=\"../empcontrol?function=delivery&Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"submit\"><i class=\"lnr lnr-select\"></i></button></form></td>\r\n</tr>");
			}else if (d.getDel_status()==1) {
				info.append("<td>正在配送</td><td><form action=\"../empcontrol?function=delivery1&Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"submit\"><i class=\"lnr lnr-earth\"></i></button></form></td>\r\n</tr>");
			}else if (d.getDel_status()==2&&d.getDel_voucher()==0) {
				info.append("<td>待确认</td><td><form action=\"../empcontrol?function=delivery2&Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"submit\"><i class=\"lnr lnr-sync\"></i></button></form></td>\r\n</tr>");
			}else {
				info.append("<td>已签收</td><td><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></td>\r\n</tr>");
			}
		}
		info.append("</tbody>");
		return info.toString();
	}

	@Override
	public String job2(Employees e) {
		List sort=ed.SearchSort(e);
		
		Iterator<Sort> it=sort.iterator();
		StringBuffer info = new StringBuffer();
		Sort s;
		Form f;
		Goodsbak g;
		info.append("<thead>\r\n<tr>\r\n<th>分拣号</th>\r\n<th>品名</th>\r\n<th>截止时间/完成时间</th>\r\n" + 
				"<th>数量</th>\r\n<th>状态</th>\r\n<th></th>\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		while (it.hasNext()) {
			s=it.next();
			List<Form> form=ed.SearchForm(s);
			Iterator<Form> it1=form.iterator();
			f=it1.next();
			List<Goodsbak> goods=ed.SearchGoods(f);
			Iterator<Goodsbak> it2=goods.iterator();
			g=it2.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+s.getSor_no()+"</a></td>\r\n<td>"+g.getGoo_name()+"</td>\r\n" + 
					"<td>"+s.getSor_time()+"</td>\r\n<td>"+f.getFor_num()+"</td>\r\n");
			if(s.getSor_state()==0) {
				info.append("<td>待分拣</td>\r\n<td><form action=\"../empcontrol?function=sort&Sor_no="+s.getSor_no()+"\" method=\"post\"><button type=\"submit\"><i class=\"lnr lnr-arrow-up\">"+
							"</i></button></form></td>\r\n</tr>");
			}else if (s.getSor_state()==1) {
				info.append("<td>任务完成</td>\r\n<td><button type=\"button\"><i class=\"lnr lnr-sync\">"+
							"</i></button></td>\r\n</tr>");
			}
		}
		info.append("</tbody>");
		return info.toString();
	}

	@Override
	public String job3() {
		List c=ed.ClientList();
		Iterator<Client> it=c.iterator();
		StringBuffer info = new StringBuffer();
		Client client;
		info.append("<div id=\"tab11\" class=\"tab-pane fade show active\" role=\"tabpanel\" aria-labelledby=\"tab-11\">\r\n" + 
				"<table class=\"account__table\">	\r\n<thead>\r\n<tr>\r\n<th>姓名</th>\r\n<th>用户编码/手机号</th>\r\n" + 
				"<th>邮箱</th>\r\n<th>性别</th>\r\n<th>生日</th>\r\n<th>密码</th>\r\n" + 
				"<th><a href=\"../admin/UserAdd.jsp\"><button type=\"button\"><i class=\"lnr lnr-users\"/></button></a></th>\r\n" + 
				"\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		while(it.hasNext()) {
			client=it.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+client.getCli_name()+"</a></td>\r\n<td>"+client.getCli_no()+"</td>\r\n" + 
					"<td>"+client.getCli_email()+"</td>\r\n<td>"+client.getCli_sex()+"</td>\r\n<td>"+client.getCli_birthday().substring(0, 10)+"</td>\r\n" + 
					"<td>"+client.getCli_password()+"</td>\r\n<th><a href=\"../admcontrol?function=user_update&id="+client.getCli_no()+"\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<form action=\"../admcontrol?function=userdelete&id="+client.getCli_no()+"\"><button type=\"submit\"><i class=\"lnr lnr-cross\"></i></button></form></th>\r\n</tr>");
		}
//		info.append("</tbody>\r\n</table>\r\n</div>\r\n\r\n<div id=\"tab12\" class=\"tab-pane fade\" role=\"tabpanel\" aria-labelledby=\"tab-12\">\r\n" + 
//				"<table class=\"account__table\">\r\n<thead>\r\n<tr>\r\n<th>商品编号</th>\r\n<th>商品名称</th>\r\n<th>销售价格</th>\r\n" + 
//				"<th>仓库编号</th>\r\n<th>商家编号</th>\r\n<th>商品类别</th>\r\n" + 
//				"<th><a href=\"../admin/Gooadd.jsp\"><button type=\"button\"><i class=\"lnr lnr-users\"/></button></a></th>\r\n" + 
//				"\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
//		
//		List g=ed.GooList();
//		Iterator<Goods> it1=g.iterator();
//		Goods goods;
//		while(it1.hasNext()) {
//			goods=it1.next();
//			info.append("<tr>\r\n<td><a href=\"#\">"+goods.getGoo_no()+"</a></td>\r\n<td>"+goods.getGoo_name()+"</td>\r\n<td>"+goods.getGoo_price()+"</td>\r\n" + 
//					"<td>"+goods.getStore()+"</td>\r\n<td>"+goods.getMer_no()+"</td>\r\n<td>"+goods.getGoo_class()+"</td>\r\n<th>\r\n" + 
//					"<a href=\"../admcontrol?function=goo_update&id="+goods.getGoo_no()+"\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
//					"<a href=\"../admcontrol?function=goodelete&id="+goods.getGoo_no()+"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
//					"</th>\r\n</tr>");
//		}
		info.append("</tbody>\r\n</table>\r\n</div>\r\n\r\n<div id=\"tab13\" class=\"tab-pane fade\" role=\"tabpanel\" aria-labelledby=\"tab-13\">\r\n" + 
				"<table class=\"account__table\">\r\n<thead>\r\n<tr>\r\n<th>工号</th>\r\n<th>姓名</th>\r\n" + 
				"<th>性别</th>\r\n<th>生日</th>\r\n<th>部门</th>\r\n<th>登录密码</th>\r\n" + 
				"<th><a href=\"../admin/Empadd.jsp\"><button type=\"button\"><i class=\"lnr lnr-users\"/></button></a></th>\r\n" + 
				"</tr>\r\n</thead>\r\n\r\n<tbody>");
		
		List e1=ed.EmpList();
		Iterator<Employees> it2=e1.iterator();
		Employees employees;
		while(it2.hasNext()) {
			employees=it2.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+employees.getEmp_no()+"</a></td>\r\n<td>"+employees.getEmp_name()+"</td>\r\n"+
					"<td>"+employees.getEmp_sex()+"</td>\r\n<td>"+employees.getEmp_birthday().substring(0, 10)+"</td>\r\n" + 
					"<td>"+employees.getDep_no()+"</td>\r\n<td>"+employees.getEmp_pwd()+"</td>\r\n<th>\r\n" + 
					"<a href=\"../admcontrol?function=emp_update&id="+employees.getEmp_no()+"\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"../admcontrol?function=empdelete&id="+employees.getEmp_no()+"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
					"</th>\r\n</tr>");
		}
		info.append("</tbody>\r\n</table>\r\n</div>\r\n\r\n<div id=\"tab14\" class=\"tab-pane fade\" role=\"tabpanel\" aria-labelledby=\"tab-14\">\r\n" + 
				"<table class=\"account__table\">\r\n<thead>\r\n<tr>\r\n<th>商家编号</th>\r\n<th>店名</th>\r\n" + 
				"<th>法人代表</th>\r\n<th>地址</th>\r\n<th>联系电话</th>\r\n<th>邮箱</th>\r\n" + 
				"<th><a href=\"../admin/Meradd.jsp\"><button type=\"button\"><i class=\"lnr lnr-users\"/></button></a></th>\r\n" + 
				"</tr>\r\n</thead>\r\n\r\n<tbody>");
		
		List m=ed.MerList();
		Iterator<Merchant> it3=m.iterator();
		Merchant merchant;
		while(it3.hasNext()) {
			merchant=it3.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+merchant.getMer_no()+"</a></td>\r\n<td>"+merchant.getMer_name()+"</td>\r\n<td>"+merchant.getMer_legal()+"</td>\r\n" + 
					"<td>"+merchant.getMer_address()+"</td>\r\n<td>"+merchant.getMer_phone()+"</td>\r\n<td>"+merchant.getMer_email()+"</td>\r\n<th>\r\n" + 
					"<a href=\"../admcontrol?function=mer_update&id="+merchant.getMer_no()+"\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"../admcontrol?function=merdelete&id="+merchant.getMer_no()+"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
					"</th>\r\n</tr>");
		}
		info.append("</tbody>\r\n</table>\r\n</div>");
		return info.toString();
	}

	@Override
	public String detail(Employees e) {
		StringBuffer info = new StringBuffer();
		info.append("<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"name\" class=\"form__label\">姓名</label>\r\n" + 
				"<input id=\"name\" type=\"text\" value=\""+e.getEmp_name()+"\" name=\"name\" class=\"form__input\">\r\n" + 
				"</div>\r\n\r\n" + 
				"<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"phone\" class=\"form__label\">工号</label>\r\n" + 
				"<input id=\"phone\" type=\"text\" value=\""+e.getEmp_no()+"\" name=\"phone\" onBlur=\"return EmpUpdateDetail()\" class=\"form__input\">\r\n" + 
				"<span id=\"checkphone\" style=\"color:#fa7268\"></span>\r\n</div>");
		return info.toString();
	}

	@Override
	public String MerDetail(Merchant m) {
		StringBuffer info = new StringBuffer();
		info.append("<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\"><label for=\"name\" class=\"form__label\">店名</label>\r\n" + 
				"<input id=\"name\" type=\"text\" value=\""+m.getMer_name()+"\" name=\"name\" class=\"form__input\"></div>\r\n" + 
				"<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\"><label for=\"Mer_legal\" class=\"form__label\">法人代表</label>\r\n" + 
				"<input id=\"Mer_legal\" type=\"text\" value=\""+m.getMer_legal()+"\" name=\"Mer_legal\" class=\"form__input\"></div>\r\n" + 
				"<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"Mer_phone\" class=\"form__label\">联系电话</label>\r\n" + 
				"<input id=\"Mer_phone\" type=\"text\" value=\""+m.getMer_phone()+"\" name=\"Mer_phone\" class=\"form__input\">\r\n" + 
				"</div><div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"email\" class=\"form__label\">Email</label>\r\n" + 
				"<input id=\"email\" type=\"text\" value=\""+m.getMer_email()+"\" name=\"email\" class=\"form__input\">\r\n" + 
				"</div><div class=\"col-12 col-md-6 col-lg-12\">\r\n" + 
				"<label for=\"Mer_address\" class=\"form__label\">地址</label>\r\n" + 
				"<input id=\"Mer_address\" type=\"text\" value=\""+m.getMer_address()+"\" name=\"Mer_address\" class=\"form__input\"></div>");
		return info.toString();
	}

	@Override
	public int UpdateEmp(Employees e) {
		return ed.UpdateEmp(e);
	}

	@Override
	public int UpdateMer(Merchant m) {
		return ed.UpdateMer(m);
	}

	@Override
	public int changepwd(Employees olde, Employees newe) {
		int num=ed.checkpwd(olde);
		if(num==2) {
			return 2;
		}else {
			return ed.changepwd(newe);
		}
	}

	@Override
	public int changepwd(Merchant oldm, Merchant newm) {
		int num=ed.checkpwd(oldm);
		if(num==2) {
			return 2;
		}else {
			return ed.changepwd(newm);
		}
	}

	@Override
	public String search(String mer_no) {
		Merchant m=new Merchant();
		m.setMer_no(mer_no);
		List<Goods> goods=ed.Mer2Goods(m);
		Iterator<Goods> it=goods.iterator();
		Goods g;
		StringBuffer info=new StringBuffer();
		while(it.hasNext()) {
			g=it.next();
			info.append("<div class=\"col-6 col-md-4 col-xl-4\">\r\n" + 
					"<article class=\"product\">\r\n" + 
					"<a class=\"product__link\"></a>\r\n" + 
					"<div class=\"product__img\">\r\n" + 
					"<img src=\""+g.getGoo_img()+"\" alt=\"\">\r\n" + 
					"</div>\r\n" +  
					"<footer class=\"product__footer\">\r\n" + 
					"<h3 class=\"product__title\">"+g.getGoo_name()+"</h3>\r\n" + 
					"<span class=\"product__price\">￥"+g.getGoo_price()+"</span>\r\n" + 
					"</footer>\r\n" + 
					"</article>\r\n" + 
					"</div>");
		}
		return info.toString();
	}

}
