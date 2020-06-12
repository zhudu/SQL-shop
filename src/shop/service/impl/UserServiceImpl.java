package shop.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.Userdao;
import shop.entity.Addres;
import shop.entity.Client;
import shop.entity.ClientDetail;
import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Form;
import shop.entity.Goods;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(Client c) {
		if(ud.Clientcheck(c)==1) {
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
			g=it1.next();
			List<Sort> sort=ud.Form2Sort(f.getFor_no());
			Iterator<Sort> it2=sort.iterator();
			s=it2.next();
			List<Delivery> deliveriy=ud.Sort2Delivery(s.getSor_no());
			Iterator<Delivery> it3=deliveriy.iterator();
			d=it3.next();
			info.append("<tr>\r\n" + 
					"<td><a href=\"#\">"+f.getFor_no()+"</a></td>\r\n" + 
					"<td>"+g.getGoo_name()+"</td>\r\n" + 
					"<td>"+f.getFor_time().substring(0, 10)+"</td>\r\n" + 
					"<td>"+f.getFor_num()+"</td>\r\n" + 
					"<td>"+f.getFor_num()*g.getGoo_price()+"</td>\r\n");
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
}
