package shop.service.impl;


import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return ed.register(e);
	}

	@Override
	public int forget(Employees e) {
		return ed.forget(e);
	}

	@Override
	public String job1(Employees e) {
		List del=ed.SearchDelivery(e);
		Iterator<Delivery> it=del.iterator();
		Delivery d;
		Addres a;
		StringBuffer info = new StringBuffer();
		info.append("<thead>\r\n<tr>\r\n<th>配送号</th>\r\n<th>收货地址</th>\r\n<th>收件人号码</th>\r\n<th>配送时间</th>\r\n" + 
				"<th>送达时间</th>\r\n<th>状态</th>\r\n<th></th>\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		while(it.hasNext()) {
			d=it.next();
			List<Addres> addres=ed.Searchaddres(d);
			Iterator<Addres> it1=addres.iterator();
			a=it1.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+d.getDel_no()+"</a></td>\r\n<td>"+a.getAdd_detail()+"</td>\r\n" + 
					"<td>"+a.getAdd_phone()+"</td>\r\n<td>"+d.getDel_gettime()+"</td>\r\n");
			if(d.getDel_status()!=2) {
				info.append("<td>----:--:--</td>");
			}else {
				info.append("<td>"+d.getDel_gettime()+"</td>");
			}
			if(d.getDel_status()==0) {
				info.append("<td>待配送</td>\r\n<td><form action=\"../empcontrol?function=delivery?Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"submit\"><i class=\"lnr lnr-select\"></i></button></form></td>\r\n</tr>");
			}else if (d.getDel_status()==1) {
				info.append("<td>正在配送</td><td><form action=\"../empcontrol?function=delivery1?Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"button\"><i class=\"lnr lnr-earth\"></i></button></form></td>\r\n</tr>");
			}else if (d.getDel_status()==2&&d.getDel_voucher()==0) {
				info.append("<td>待确认</td><td><form action=\"../empcontrol?function=delivery2?Del_no="+d.getDel_no()+"\" method=\"post\">"+
							"<button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></form></td>\r\n</tr>");
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
		Goods g;
		info.append("<thead>\r\n<tr>\r\n<th>分拣号</th>\r\n<th>品名</th>\r\n<th>截止时间/完成时间</th>\r\n" + 
				"<th>数量</th>\r\n<th>状态</th>\r\n<th></th>\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		while (it.hasNext()) {
			s=it.next();
			List<Form> form=ed.SearchForm(s);
			Iterator<Form> it1=form.iterator();
			f=it1.next();
			List<Goods> goods=ed.SearchGoods(f);
			Iterator<Goods> it2=goods.iterator();
			g=it2.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+s.getSor_no()+"</a></td>\r\n<td>"+g.getGoo_name()+"</td>\r\n" + 
					"<td>"+s.getSor_time()+"</td>\r\n<td>"+f.getFor_num()+"</td>\r\n");
			if(s.getSor_state()==0) {
				info.append("<td>待分拣</td>\r\n<td><form action=\"../empcontrol?function=sort?Sor_no="+s.getSor_no()+"\" method=\"post\"><button type=\"submit\"><i class=\"lnr lnr-arrow-up\">"+
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
					"<td>"+client.getCli_password()+"</td>\r\n<th><a href=\"../admin/Userupdate.jsp\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<form action=\"../admcontrol?function=userdelete&id="+client.getCli_no()+"\"><button type=\"submit\"><i class=\"lnr lnr-cross\"></i></button></form></th>\r\n</tr>");
		}
		info.append("</tbody>\r\n</table>\r\n</div>\r\n\r\n<div id=\"tab12\" class=\"tab-pane fade\" role=\"tabpanel\" aria-labelledby=\"tab-12\">\r\n" + 
				"<table class=\"account__table\">\r\n<thead>\r\n<tr>\r\n<th>商品编号</th>\r\n<th>商品名称</th>\r\n<th>销售价格</th>\r\n" + 
				"<th>仓库编号</th>\r\n<th>商家编号</th>\r\n<th>商品类别</th>\r\n" + 
				"<th><a href=\"../admin/Gooadd.jsp\"><button type=\"button\"><i class=\"lnr lnr-users\"/></button></a></th>\r\n" + 
				"\r\n</tr>\r\n</thead>\r\n\r\n<tbody>");
		
		List g=ed.GooList();
		Iterator<Goods> it1=g.iterator();
		Goods goods;
		while(it1.hasNext()) {
			goods=it1.next();
			info.append("<tr>\r\n<td><a href=\"#\">"+goods.getGoo_no()+"</a></td>\r\n<td>"+goods.getGoo_name()+"</td>\r\n<td>"+goods.getGoo_price()+"</td>\r\n" + 
					"<td>"+goods.getStore()+"</td>\r\n<td>"+goods.getMer_no()+"</td>\r\n<td>"+goods.getGoo_class()+"</td>\r\n<th>\r\n" + 
					"<a href=\"../admin/Gooupdate.jsp\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
					"</th>\r\n</tr>");
		}
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
					"<a href=\"../admin/Empupdate.jsp\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
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
					"<a href=\"../admin/Merupdate.jsp\"><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></a>\r\n" + 
					"<a href=\"\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></a>\r\n" + 
					"</th>\r\n</tr>");
		}
		info.append("</tbody>\r\n</table>\r\n</div>");
		return info.toString();
	}

}
