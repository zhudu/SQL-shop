package shop.web;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.spec.C14NMethodParameterSpec;

import org.apache.derby.catalog.types.UDTAliasInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.entity.Addres;
import shop.entity.Client;
import shop.entity.ClientDetail;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.service.Userservice;

@Controller
public class UserControl {
	@Autowired
	private Userservice us;
	
	@RequestMapping(value="/usercontrol", params= {"function=login"})	//登录√
	private void fun_login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("登录检查");
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		String remember = request.getParameter("remember");
		System.out.println(remember);
		Client c = new Client();
		c.setCli_no(phone);
		c.setCli_password(password);
		ClientDetail c1=us.login(c);
		int  status = c1.getI();
		try {
			if(status==1) {
				System.out.println("验证通过");
				HttpSession ss = request.getSession();
				ss.setAttribute("hasLogin", "yes"); 
				ss.setAttribute("Cli_no", phone);
				ss.setAttribute("clientdetail",c1.getInfo());
				ss.setAttribute("AddressDetail", us.AddressDetail(phone));	//查询该用户的收货地址
				ss.setAttribute("FormDetail", us.FormDetail(phone));		//查询该用户已有的订单情况
				if(remember!=null) {
					Cookie cookie = new Cookie("u", phone);
					cookie.setMaxAge(7*24*60*60);//如果登录成功，设置cookie的存活时间
		            //发送cookie到客户端
		            response.addCookie(cookie);
				}else {
					Cookie cookie=new Cookie("u",null);
					cookie.setMaxAge(0);
		            response.addCookie(cookie);
				}
				response.sendRedirect("user/index.jsp");		//跳转操作界面
			}else {
				//返回登录界面
				response.getWriter().print("<script>alert('登录出错 请重试！');window.location.href='user/authorization.jsp';</script>");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=logout"})	//登出√
	private void fun_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		ss.removeAttribute("hasLogin");
		try {
			response.sendRedirect("user/authorization.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=search"})	//搜索商品
	private void fun_search(HttpServletRequest request, HttpServletResponse response) {
		String searchname=request.getParameter("searchname");
		String result=us.search(searchname);
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=insert"})
	private void fun_insert(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=update"})
	private void fun_update(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=deleteaddress"})
	private void fun_delete(HttpServletRequest request, HttpServletResponse response) {
		String Add_no=request.getParameter("Add_no");
		Addres a=new Addres();
		a.setAdd_no(Add_no);
		int num=us.deleteadd(a);
		
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('删除失败 请重试！');window.location.href='user/account.jsp';</script>");
			}else {
				HttpSession ss = request.getSession();
				String Cli_no=(String)ss.getAttribute("Cli_no");
				ss.setAttribute("AddressDetail", us.AddressDetail(Cli_no));	//更新该用户的收货地址
				response.sendRedirect("user/account.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
 	
	@RequestMapping(value="/usercontrol", params= {"function=register"})	//注册用户
	private void fun_register(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String phone=request.getParameter("phone1");
		String Cli_id=request.getParameter("Cli_id");
		String password=request.getParameter("password1");
		//提取隐藏信息，生日与性别
		int sex=Integer.parseInt(Cli_id.substring(16, 17))%2;	//1为男，0为女
		String birthday = Cli_id.substring(6, 10)+"-"+Cli_id.substring(10, 12)+"-"+Cli_id.substring(12, 14);
		System.out.println(name+phone+Cli_id+password);
		//将获取的信息写入实体
		Client c = new Client();
		c.setCli_name(name);
		c.setCli_no(phone);
		c.setCli_id(Cli_id);
		c.setCli_password(password);
		if(sex==1) {
			c.setCli_sex("男");
		}else {
			c.setCli_sex("女");
		}
		c.setCli_birthday(birthday);
		int num = us.register(c);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('用户已存在 请重试！');window.location.href='user/authorization.jsp';</script>");
			}else {
				response.sendRedirect("user/authorization.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=forget"})		//忘记密码
	private void fun_forget(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone2");				//获取表单信息
		String Cli_id=request.getParameter("id");
		String password=request.getParameter("password3");
		//将获取的信息写入实体
		Client c = new Client();
		c.setCli_no(phone);
		c.setCli_id(Cli_id);
		c.setCli_password(password);
		int num = us.forget(c);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('填写信息出错 请重试！');window.location.href='user/authorization.jsp';</script>");
			}else {
				response.sendRedirect("user/authorization.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=addAddress"})	//添加地址
	private void fun_addAddress(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Cli_no=(String)ss.getAttribute("Cli_no");
		String name=request.getParameter("name");	
		String phone=request.getParameter("phone");	
		String provincevalue=request.getParameter("provincevalue");	
		String cityvalue=request.getParameter("cityvalue");	
		String street=request.getParameter("street");
		String newstreet=provincevalue+cityvalue+street;
		Addres a=new Addres();
		a.setAdd_detail(newstreet);
		a.setAdd_name(name);
		a.setAdd_phone(phone);
		a.setCli_no(Cli_no);
		int num=us.addAddress(a);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('保存失败 请重试！');window.location.href='user/address.jsp';</script>");
			}else {
				ss.setAttribute("AddressDetail", us.AddressDetail(Cli_no));	//更新该用户的收货地址
				response.sendRedirect("user/account.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=saveClient"})
	private void fun_saveClient(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Cli_no=(String)ss.getAttribute("Cli_no");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		Client c=new Client();
		c.setCli_email(email);
		c.setCli_name(name);
		c.setCli_no(Cli_no);
		int num=us.UpdateClient(c);

		try {
			if(num==1) {
				String info=us.detail(c);
				ss.setAttribute("clientdetail",info);
				response.sendRedirect("user/account.jsp");
			}else {
				response.getWriter().print("<script>alert('保存失败 请重试！');window.location.href='user/account.jsp';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/usercontrol", params= {"function=pwdchange"})
	private void fun_pwdchange(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Cli_no=(String)ss.getAttribute("Cli_no");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		Client oldc=new Client();
		Client newc=new Client();
		oldc.setCli_no(Cli_no);
		oldc.setCli_password(oldpassword);
		newc.setCli_no(Cli_no);
		newc.setCli_password(newpassword);
		int num=us.changepwd(oldc,newc);
		
		try {
			if (num==2) {
				response.getWriter().print("<script>alert('密码错误 请重试！');window.location.href='user/account.jsp';</script>");
			}else if(num==1){
				response.getWriter().print("<script>alert('更新成功 请重新登录！');</script>");
				fun_logout(request, response);
			}else {
				response.getWriter().print("<script>alert('更新失败 请重试！');window.location.href='user/account.jsp';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
