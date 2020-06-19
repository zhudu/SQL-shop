package shop.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.derby.tools.sysinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.Userdao;
import shop.entity.Addres;
import shop.entity.Cart;
import shop.entity.Client;
import shop.entity.ClientDetail;
import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Form;
import shop.entity.Goods;
import shop.entity.Merchant;
import shop.entity.Sort;
import shop.service.Userservice;

@Service("userservice")
public class UserServiceImpl implements Userservice{
	@Autowired
	private Userdao ud;

	public Userdao getUd() {
		return ud;
	}

	public void setUd(Userdao ud) {
		this.ud = ud;
	}

	@Override
	public ClientDetail login(Client c) {
		ClientDetail cd=new ClientDetail();
		List<Client> rs=ud.login(c);
		Iterator<Client> it=rs.iterator();
		Client c1=new Client();
		if(it.hasNext()) {
			c1=it.next();
		}
		if(c1.getCli_no()!=null) {
			String info=detail(c1);
			cd.setI(1);
			cd.setC(c1);
			cd.setInfo(info);
		}
		
		return cd;
	}

	@Override
	public String search(String searchname) {
		List<Goods> goods=ud.search(searchname);
		Iterator<Goods> it=goods.iterator();
		Goods g;
		StringBuffer info = new StringBuffer();
		info.append("<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse1\" aria-expanded=\"false"
				+ "\" aria-controls=\"collapse1\">文具</button>\r\n<div class=\"collapse\" id=\"collapse1\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=文具\">文具</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse2\" aria-expanded=\"false"
				+ "\" aria-controls=\"collapse2\">家具</button>\r\n" + 
				"\r\n<div class=\"collapse\" id=\"collapse2\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=家具\">家具</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse3\" aria-expanded=\"false"
				+ "\" aria-controls=\"collapse3\">手表</button>\r\n" + 
				"\r\n<div class=\"collapse\" id=\"collapse3\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=手表\">手表</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse4\" aria-expanded=\"false"
				+ "\" aria-controls=\"collapse4\">服饰</button>\r\n" + 
				"\r\n<div class=\"collapse\" id=\"collapse4\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=服饰\">服饰</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n</div>	\r\n</div>\r\n</div>\r\n<!-- end sidebar -->\r\n\r\n" + 
				"<!-- product-grid -->\r\n" + 
				"<div class=\"col-12 col-xl-9\">\r\n" + 
				"<div class=\"product-grid row\">");
		while (it.hasNext()) {
			g=it.next();
			info.append("<div class=\"col-6 col-md-4 col-xl-4\">\r\n" + 
					"<article class=\"product\">\r\n" + 
					"<a href=\"../usercontrol?function=product&no="+g.getGoo_no()+"\" class=\"product__link\"></a>\r\n" + 
					"<div class=\"product__img\">\r\n" + 
					"<img src=\""+g.getGoo_img()+"\" alt=\"\">\r\n" + 
					"</div>\r\n" + 
					"<a href=\"../usercontrol?function=productadd1&no="+g.getGoo_no()+"\" class=\"product__add\"><svg  xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"16px\" height=\"16px\"><path fill-rule=\"evenodd\" d=\"M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z\"/></svg></a>\r\n" + 
					"<footer class=\"product__footer\">\r\n" + 
					"<h3 class=\"product__title\">"+g.getGoo_name()+"</h3>\r\n" + 
					"<span class=\"product__price\">￥"+g.getGoo_price()+"</span>\r\n" + 
					"</footer>\r\n" + 
					"</article>\r\n" + 
					"</div>");
		}
		return info.toString();
	}

	@Override
	public int register(Client c) {
		if(ud.Clientcheck(c)==0) {		//账号不存在才创建账号
			return ud.register(c);
		}else {
			return 0;
		}
	}

	@Override
	public int forget(Client c) {
		return ud.forget(c);
	}

	@Override
	public String detail(Client c) {
		StringBuffer info = new StringBuffer();
		info.append("<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"name\" class=\"form__label\">姓名</label>\r\n" + 
				"<input id=\"name\" type=\"text\" name=\"name\" value=\""+c.getCli_name()+"\" class=\"form__input\">\r\n" + 
				"</div>\r\n\r\n" + 
				"<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"phone\" class=\"form__label\">手机号</label>\r\n" + 
				"<input id=\"phone\" type=\"text\" name=\"phone\" value=\""+c.getCli_no()+"\" onBlur=\"return AccountUpdateDetail()\" class=\"form__input\">\r\n" + 
				"<span id=\"checkphone\" style=\"color:#fa7268\"></span></div>\r\n\r\n" + 
				"<div class=\"col-12 col-md-6 col-lg-12 col-xl-6\">\r\n" + 
				"<label for=\"email\" class=\"form__label\">Email</label>\r\n" + 
				"<input id=\"email\" type=\"text\" name=\"email\" value=\""+c.getCli_email()+"\" onBlur=\"return AccountUpdateDetail()\" class=\"form__input\">\r\n"+
				"<span id=\"checkemail\" style=\"color:#fa7268\"></span></div>");
		return info.toString();
	}

	@Override
	public String AddressDetail(String phone) {
		List<Addres> addres=ud.Address(phone);
		StringBuffer info = new StringBuffer();
		Iterator<Addres> it=addres.iterator();
		Addres a;
		while(it.hasNext()) {
			a=it.next();
			info.append("<tr>\r\n" + 
					"<td><a href=\"#\">"+a.getAdd_name()+"</a></td>\r\n" + 
					"<td>"+a.getAdd_detail()+"</td>\r\n" + 
					"<td>"+a.getAdd_phone()+"</td>\r\n" + 
					"<td><form action=\"../usercontrol?function=deleteaddress?Add_no="+a.getAdd_no()+
					"\" method=\"post\"><button type=\"button\"><i class=\"lnr lnr-cross\"></i></button></form></td>\r\n" + 
					"</tr>");
		}
		return info.toString();
	}

	@Override
	public String FormDetail(String phone) {
		List<Form> form=ud.Form(phone);
		Iterator<Form> it=form.iterator();
		StringBuffer info = new StringBuffer();
		Form f;
		Goods g;
		Sort s;
		Delivery d;
		while (it.hasNext()) {
			f=it.next();
			List<Goods> goods=ud.Form2Goods(f.getGoo_no());
			Iterator<Goods> it1=goods.iterator();
			if(it1.hasNext()) {
				g=it1.next();
				info.append("<tr>\r\n" + 
						"<td><a href=\"#\">"+f.getFor_no()+"</a></td>\r\n" + 
						"<td>"+g.getGoo_name()+"</td>\r\n" + 
						"<td>"+f.getFor_time().substring(0, 10)+"</td>\r\n" + 
						"<td>"+f.getFor_num()+"</td>\r\n" + 
						"<td>"+f.getFor_num()*g.getGoo_price()+"</td>\r\n");
				List<Sort> sort=ud.Form2Sort(f.getFor_no());
				Iterator<Sort> it2=sort.iterator();
				if(it2.hasNext()) {
					s=it2.next();
					List<Delivery> deliveriy=ud.Sort2Delivery(s.getSor_no());
					Iterator<Delivery> it3=deliveriy.iterator();
					if(it3.hasNext()) {
						d=it3.next();
						
						if(s.getSor_state()==0) {
							info.append("<td>待出库</td>\r\n" + 
									"<td><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></td>\r\n</tr>");
						}else if (s.getSor_state()==1) {
							if(d.getDel_status()==0) {
								info.append("<td>待配送</td>\r\n" + 
										"<td><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></td>\r\n</tr>");
							}else if (d.getDel_status()==1) {
								info.append("<td>配送中</td>\r\n" + 
										"<td><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></td>\r\n</tr>");
							}else if (d.getDel_status()==2) {
								info.append("<td>已送达，请确认</td>\r\n" + 
										"<td><button type=\"button\"><i class=\"lnr lnr-sync\"></i></button></td>\r\n</tr>");
							}
						}
					}
				}else {
					info.append("</tr>");
				}
			}
		}
		return info.toString();
	}

	@Override
	public int addAddress(Addres a) {
		int i;
		Random random = new Random();
		String no="";
		do {
			for(i=0;i<4;i++) {
				int j=random.nextInt(100);
				if(j<10) {
					no=no+"0"+String.valueOf(j);
				}else {
					no=no+String.valueOf(j);
				}
			}
		} while (ud.Addressno(no)==1);
		a.setAdd_no(no);
		return ud.addAddress(a);
	}

	@Override
	public int UpdateClient(Client c) {
		return ud.UpdateClient(c);
	}

	@Override
	public int changepwd(Client oldc, Client newc) {
		int num=ud.checkpwd(oldc);
		if(num==2) {
			return 2;
		}else {
			return ud.changepwd(newc);
		}
	}

	@Override
	public int deleteadd(Addres a) {
		return ud.deleteadd(a);
	}

	@Override
	public String product(Goods g) {
		List<Goods> goods=ud.searchgood(g);
		Iterator<Goods> it=goods.iterator();
		Goods g1;
		g1=it.next();
		List<Merchant> Mer=ud.searchmer(g1.getMer_no());
		Iterator<Merchant> it1=Mer.iterator();
		Merchant m;
		m=it1.next();
		StringBuffer info = new StringBuffer();
		info.append("<div class=\"col-12 col-md-6\">\r\n" + 
				"<div class=\"product-head__content\">\r\n" + 
				"<div class=\"product-head__wrap\">\r\n" + 
				"<div class=\"product-head__slider owl-carousel\">\r\n" + 
				"<div class=\"product-head__slide\">\r\n" + 
				"<img src=\""+g1.getGoo_img()+"\" alt=\"\">\r\n" + 
				"</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"product-head__navs\">\r\n" + 
				"<button class=\"product-head__nav product-head__nav--prev\" type=\"button\">\r\n" + 
				"<i class=\"lnr lnr-arrow-left\"></i>\r\n" + 
				"</button>\r\n" + 
				"<button class=\"product-head__nav product-head__nav--next\" type=\"button\">\r\n" + 
				"<i class=\"lnr lnr-arrow-right\"></i>\r\n" + 
				"</button>\r\n</div>\r\n\r\n" + 
				"<div class=\"product-head__counter\"></div>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n<!-- end slider -->\r\n\r\n" + 
				"<!-- content -->\r\n" + 
				"<div class=\"col-12 col-md-6\">\r\n" + 
				"<div class=\"product-head__content product-head__content--2\">\r\n" + 
				"<h1 class=\"product-head__title product-head__title--dark\">"+g1.getGoo_name()+"</h1>\r\n" + 
				"<p class=\"product-head__text product-head__text--dark\">"+g1.getGoo_detail()
				+"</p>\r\n" + 
				"<form action=\"../usercontrol?function=addproduct&no="+g1.getGoo_no()+"\" method=\"post\">\r\n" + 
				"<div class=\"product-head__list\">\r\n" + 
				"<div class=\"cart__item-quantity cart__item-quantity--dark2\">\r\n" + 
				"<button id=\"lb\">\r\n" + 
				"<i class=\"lnr lnr-chevron-left\"></i>\r\n" + 
				"</button>\r\n" + 
				"<input id=\"num\"  name=\"num\" type=\"text\" value=\"1\">\r\n" + 
				"<button id=\"rb\">\r\n" + 
				"<i class=\"lnr lnr-chevron-right\"></i>\r\n" + 
				"</button>\r\n</div></div>\r\n\r\n" + 
				"<div class=\"product-head__list\">\r\n" + 
				"<button class=\"product-head__btn product-head__btn--dark\" type=\"submit\">加入购物车</button>\r\n" + 
				"\r\n" + 
				"<span class=\"product-head__price\">￥"+g1.getGoo_price()+"</span>\r\n" + 
				"</div>\r\n" + 
				"<p class=\"product-head__text product-head__text--dark\">"+m.getMer_name()+"</p>"+
				"</form>\r\n" + 
				"</div>\r\n" + 
				"</div>\r\n" + 
				"<!-- end content -->");
		return info.toString();
	}

	@Override
	public String classfind(Goods g) {
		List<Goods> goods=ud.classfind(g);
		Iterator<Goods> it=goods.iterator();
		Goods g1;
		StringBuffer info = new StringBuffer();
		String cla=g.getGoo_class();
		info.append("<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse1\" aria-expanded=\"");
		if(cla.equals("文具")) {
			info.append("true");
		}
		else {
			info.append("false");
		}
		info.append("\" aria-controls=\"collapse1\">文具</button>\r\n" +  
				"<div class=\"");
		info.append(cla.equals("文具")?"collapse show":"collapse");
		info.append("\" id=\"collapse1\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a ");
		if(cla.equals("文具")) {
			info.append("class=\"active\"");
		}
		info.append(" href=\"../usercontrol?function=class&class=文具\">文具</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse2\" aria-expanded=\"");
		if(cla.equals("家具")) {
			info.append("true");
		}
		else {
			info.append("false");
		}
		info.append("\" aria-controls=\"collapse2\">家具</button>\r\n" + 
				"\r\n<div class=\"");info.append(cla.equals("家具")?"collapse show":"collapse");info.append("\" id=\"collapse2\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=家具\"");
		if(cla.equals("家具")) {
			info.append("class=\"active\"");
		}
		info.append(">家具</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse3\" aria-expanded=\"");
		if(cla.equals("手表")) {
			info.append("true");
		}
		else {
			info.append("false");
		}
		info.append("\" aria-controls=\"collapse3\">手表</button>\r\n" + 
				"\r\n<div class=\"");info.append(cla.equals("手表")?"collapse show":"collapse");info.append("\" id=\"collapse3\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=手表\"");
		if(cla.equals("手表")) {
			info.append("class=\"active\"");
		}
		info.append(">手表</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n\r\n" + 
				"<div class=\"catalog-menu__item\">\r\n" + 
				"<button type=\"button\" data-toggle=\"collapse\" data-target=\"#collapse4\" aria-expanded=\"");
		if(cla.equals("服饰")) {
			info.append("true");
		}
		else {
			info.append("false");
		}
		info.append("\" aria-controls=\"collapse4\">服饰</button>\r\n" + 
				"\r\n<div class=\"");info.append(cla.equals("服饰")?"collapse show":"collapse");info.append("\" id=\"collapse4\">\r\n" + 
				"<div class=\"catalog-menu__collapse\">\r\n" + 
				"<a href=\"../usercontrol?function=class&class=服饰\"");
		if(cla.equals("服饰")) {
			info.append("class=\"active\"");
		}
		info.append(">服饰</a>\r\n" + 
				"</div>\r\n</div>\r\n</div>\r\n</div>	\r\n</div>\r\n</div>\r\n<!-- end sidebar -->\r\n\r\n" + 
				"<!-- product-grid -->\r\n" + 
				"<div class=\"col-12 col-xl-9\">\r\n" + 
				"<div class=\"product-grid row\">");
		while (it.hasNext()) {
			g1=it.next();
			info.append("<div class=\"col-6 col-md-4 col-xl-4\">\r\n" + 
					"<article class=\"product\">\r\n" + 
					"<a href=\"../usercontrol?function=product&no="+g1.getGoo_no()+"\" class=\"product__link\"></a>\r\n" + 
					"<div class=\"product__img\">\r\n" + 
					"<img src=\""+g1.getGoo_img()+"\" alt=\"\">\r\n" + 
					"</div>\r\n" + 
					"<a href=\"../usercontrol?function=productadd1&no="+g1.getGoo_no()+"\" class=\"product__add\"><svg  xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"16px\" height=\"16px\"><path fill-rule=\"evenodd\" d=\"M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z\"/></svg></a>\r\n" + 
					"<footer class=\"product__footer\">\r\n" + 
					"<h3 class=\"product__title\">"+g1.getGoo_name()+"</h3>\r\n" + 
					"<span class=\"product__price\">￥"+g1.getGoo_price()+"</span>\r\n" + 
					"</footer>\r\n" + 
					"</article>\r\n" + 
					"</div>");
		}
		return info.toString();
	}

	@Override
	public int addcart(Cart c) {
		int num=ud.searchcart(c);
		int num1=0;
		if(num!=0) {
			num=num+1;
			c.setCart_num(num);
			num1=ud.updatecart(c);
		}else {
			num1=ud.insertcart(c);
		}
		return num1;
	}

	@Override
	public int cartnum(String cli_no) {
		int num=ud.cartnum(cli_no);
		return num;
	}

	@Override
	public String cart(String cli_no) {
		List<Cart> c=ud.cart(cli_no);
		int sum=0;
		StringBuffer info = new StringBuffer();
		Cart c1;
		Goods g;
		Iterator<Cart> it=c.iterator();
		while(it.hasNext()) {
			c1=it.next();
			List<Goods> g1=ud.goodfind(c1.getGoo_no());
			Iterator<Goods> it1=g1.iterator();
			g=it1.next();
			sum+=c1.getCart_num()*g.getGoo_price();
			info.append("<div class=\"cart__item\">\r\n" + 
					"<div class=\"cart__item-img\">\r\n" + 
					"<img src=\""+g.getGoo_img()+"\" alt=\"\">\r\n" + 
					"</div>\r\n\r\n" + 
					"<div class=\"cart__item-wrap\">\r\n" + 
					"<div class=\"cart__item-content\">\r\n" + 
					"<h3>"+g.getGoo_name()+"</h3>\r\n" + 
					"<ul>\r\n" + 
					"<li>"+g.getGoo_detail()+"</li>\r\n" + 
					"</ul>\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"<div class=\"cart__item-quantity\">\r\n" + 
					"<button>\r\n" + 
					"<a href=\"../usercontrol?function=deccart&no="+g.getGoo_no()+"&num="+c1.getCart_num()+"\"><i class=\"lnr lnr-chevron-left\"></i></a>\r\n" + 
					"</button>\r\n" + 
					"<input type=\"text\" value=\""+c1.getCart_num()+"\">\r\n" + 
					"<button>\r\n" + 
					"<a href=\"../usercontrol?function=pluscart&no="+g.getGoo_no()+"&num="+c1.getCart_num()+"\"><i class=\"lnr lnr-chevron-right\"></i></a>\r\n" + 
					"</button>\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"<div class=\"cart__item-price\">￥"+g.getGoo_price()+"</div>\r\n" + 
					"\r\n" + 
					"<button class=\"cart__item-delete\" type=\"button\">\r\n" + 
					"<a href=\"../usercontrol?function=deletecart&no="+g.getGoo_no()+"\"><i class=\"lnr lnr-cross\"></i></a>\r\n" + 
					"</button>\r\n" + 
					"</div>\r\n</div>");
		}
		info.append("</div>\r\n" + 
				"\r\n" + 
				"<div class=\"cart__total\">\r\n" + 
				"<div class=\"cart__total-wrap\">\r\n" + 
				"<div class=\"cart__total-value\">共计: <b>￥"+sum+"</b></div>\r\n" + 
				"<a href=\"../usercontrol?function=checkoutdetail\" class=\"cart__total-btn\">结算</a>\r\n" + 
				"</div>\r\n</div>");
		return info.toString();
	}

	@Override
	public int deletecart(Cart c) {
		return ud.deletecart(c);
	}

	@Override
	public String checkoutaddress(String cli_no) {
		StringBuffer info = new StringBuffer();
		int i=1;
		Addres a1;
		List< Addres> a=ud.Address(cli_no);
		Iterator<Addres> it1=a.iterator();
		while (it1.hasNext()) {
			a1=it1.next();
			info.append("<li>\r\n" + 
					"<input id=\"address"+i+"\" type=\"radio\" value=\""+a1.getAdd_no()+"\" name=\"address\" ");
			if (i==1) {
				info.append("checked=\"checked\"");
			}
			info.append(">\r\n" + 
					"<label for=\"address"+i+"\">"+a1.getAdd_detail()+"     "+a1.getAdd_name()+"     "+a1.getAdd_phone()+"</label>\r\n" + 
					"</li>");
			i++;
		}
		return info.toString();
	}

	@Override
	public String checkoutimg(String cli_no) {
		StringBuffer info = new StringBuffer();
//		int sum=0;
		Cart c1;
		Goods g;
		List<Cart> c=ud.cart(cli_no);
		Iterator<Cart> it=c.iterator();
		while(it.hasNext()) {
			c1=it.next();
			List<Goods> g1=ud.goodfind(c1.getGoo_no());
			Iterator<Goods> it1=g1.iterator();
			g=it1.next();
//			sum+=c1.getCart_num()*g.getGoo_price();
			info.append("<a href=\"../usercontrol?function=product&no="+c1.getGoo_no()+"\">\r\n" + 
					"<img src=\""+g.getGoo_img()+"\" alt=\"\">\r\n" + 
					"</a>");
		}
		return info.toString();
	}

	@Override
	public String checkouttotal(String cli_no) {
		StringBuffer info = new StringBuffer();
		int sum=0;
		Cart c1;
		Goods g;
		List<Cart> c=ud.cart(cli_no);
		Iterator<Cart> it=c.iterator();
		while(it.hasNext()) {
			c1=it.next();
			List<Goods> g1=ud.goodfind(c1.getGoo_no());
			Iterator<Goods> it1=g1.iterator();
			g=it1.next();
			sum+=c1.getCart_num()*g.getGoo_price();
		}
		info.append(sum);
		return info.toString();
	}

	@Override
	public String addaddress(Addres a) {
		int i;
		Random random = new Random();
		String no="";
		do {
			for(i=0;i<4;i++) {
				int j=random.nextInt(100);
				if(j<10) {
					no=no+"0"+String.valueOf(j);
				}else {
					no=no+String.valueOf(j);
				}
			}
		} while (ud.Addressno(no)==1);
		a.setAdd_no(no);
		int num=ud.addAddress(a);
		if(num==0) {
			return null;
		}else {
			return no;
		}
	}

	@Override
	public int addform(Form f) {
		int i;
		Random random = new Random();
		String no="";
		String clino=f.getCli_no();
		List<Cart> c=ud.cart(clino);
		Iterator<Cart> it=c.iterator();
		Cart c1;
		while(it.hasNext()) {
			do {
				for(i=0;i<5;i++) {
					int j=random.nextInt(100);
					if(j<10) {
						no=no+"0"+String.valueOf(j);
					}else {
						no=no+String.valueOf(j);
					}
				}
			} while (ud.Formno(no)==1);
			f.setFor_no(no);
			c1=it.next();
			f.setFor_num(c1.getCart_num());
			f.setGoo_no(c1.getGoo_no());
			ud.addform(f);
			no="";
		}
		return 1;
	}

	@Override
	public int updatecart(Cart c) {
		int num=ud.updatecart(c);
		return 1;
	}

	@Override
	public void test(String no) {
		ud.test(no);
		
	}
}
