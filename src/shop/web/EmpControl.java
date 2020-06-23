package shop.web;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.tags.EditorAwareTag;

import com.sun.swing.internal.plaf.metal.resources.metal;

import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Merchant;
import shop.entity.MerchantDetail;
import shop.entity.Sort;
import shop.entity.empjob;
import shop.service.Empservice;

@Controller
public class EmpControl {
	@Autowired
	private Empservice es;
	
	@RequestMapping(value="/empcontrol", params= {"function=login"})//登录检查√
	private void fun_login(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");				//获取表单信息
		String password=request.getParameter("password");
		String remember = request.getParameter("remember");
		Employees e = new Employees();				//将表单内容写入实体
		e.setEmp_no(phone);
		e.setEmp_pwd(password);
		empjob ej= es.login(e);		//获取员工部门信息
		try {
			if(ej.getI()==1) {			//判断员工类型
				HttpSession ss = request.getSession();
				ss.setAttribute("hasLogin", "yes"); 
				ss.setAttribute("empjob", ej.getInfo());		//将工作内容写入session属性
				ss.setAttribute("Emp_name", ej.getE().getEmp_name());
				ss.setAttribute("Emp_no", ej.getE().getEmp_no());
				e.setEmp_name(ej.getE().getEmp_name());
				ss.setAttribute("empdetail", es.detail(e));
				ss.setAttribute("depno", "1");
				if(remember!=null) {
					Cookie cookie = new Cookie("e", phone);
					cookie.setMaxAge(7*24*60*60);//如果登录成功，设置cookie的存活时间
		            //发送cookie到客户端
		            response.addCookie(cookie);
				}else {
					Cookie cookie=new Cookie("e",null);
					cookie.setMaxAge(0);
		            response.addCookie(cookie);
				}
				response.sendRedirect("emp/job.jsp");		//跳转分拣员/配送员操作界面
			}else if (ej.getI()==2) {
				HttpSession ss = request.getSession();
				ss.setAttribute("hasLogin", "yes"); 
				ss.setAttribute("empjob", ej.getInfo());
				ss.setAttribute("Emp_name", ej.getE().getEmp_name());
				ss.setAttribute("Emp_no", ej.getE().getEmp_no());
				e.setEmp_name(ej.getE().getEmp_name());
				ss.setAttribute("empdetail", es.detail(e));
				ss.setAttribute("depno", "2");
				if(remember!=null) {
					Cookie cookie = new Cookie("e", phone);
					cookie.setMaxAge(7*24*60*60);//如果登录成功，设置cookie的存活时间
		            //发送cookie到客户端
		            response.addCookie(cookie);
				}else {
					Cookie cookie=new Cookie("e",null);
					cookie.setMaxAge(0);
		            response.addCookie(cookie);
				}
				response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
			
			}else {
				//返回登录界面
				response.getWriter().print("<script>alert('登录出错 请重试！');window.location.href='emp/admin.jsp';</script>");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=logout"})//登出√
	private void fun_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		ss.removeAttribute("hasLogin");
		try {
			response.sendRedirect("emp/admin.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=merlogin"})//商家登录
	private void fun_merlogin(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");				//获取表单信息
		String password=request.getParameter("password");
		String remember = request.getParameter("remember");
		Merchant m=new Merchant();
		m.setMer_no(phone);
		m.setMer_pwd(password);
		MerchantDetail md=es.merlogin(m);
		if(md.getI()==1) {
			HttpSession ss = request.getSession();
			ss.setAttribute("hasLogin", "yes");
			ss.setAttribute("Mer2Goods", md.getInfo());
			ss.setAttribute("Mer_no", md.getM().getMer_no());
			ss.setAttribute("Mer_name", md.getM().getMer_name());
			ss.setAttribute("merdetail", es.MerDetail(md.getM()));
			if(remember!=null) {
				Cookie cookie = new Cookie("m", phone);
				cookie.setMaxAge(7*24*60*60);//如果登录成功，设置cookie的存活时间
	            //发送cookie到客户端
	            response.addCookie(cookie);
			}else {
				Cookie cookie=new Cookie("m",null);
				cookie.setMaxAge(0);
	            response.addCookie(cookie);
			}
			try {
				response.sendRedirect("Mer/account.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			//返回登录界面
			try {
				response.getWriter().print("<script>alert('登录出错 请重试！');window.location.href='Mer/authorization.jsp';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=merlogout"})//商家登出
	private void fun_merlogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		ss.removeAttribute("hasLogin");
		try {
			response.sendRedirect("Mer/authorization.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=M2G"})//
	private void fun_M2G(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Mer_no=(String)ss.getAttribute("Mer_no");
		String info=es.search(Mer_no);
		ss.setAttribute("M2Goods",info);
		try {
			response.sendRedirect("Mer/catalog.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=register"})//注册账号√
	private void fun_register(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String Emp_no=request.getParameter("Emp_no");
		String Emp_pwd=request.getParameter("password1");
		String Emp_ID=request.getParameter("Emp_ID");
		String Dep_no=request.getParameter("Dep_no");
		System.out.println(name+Emp_no+Emp_pwd+Emp_ID+Dep_no);
		//提取隐藏信息，生日与性别
		int sex=Integer.parseInt(Emp_ID.substring(16, 17))%2;
		String birthday = Emp_ID.substring(6, 10)+"-"+Emp_ID.substring(10, 12)+"-"+Emp_ID.substring(12, 14);
		//将获取的信息写入实体
		Employees e = new Employees();
		e.setEmp_name(name);
		e.setEmp_no(Emp_no);
		e.setEmp_pwd(Emp_pwd);
		e.setEmp_ID(Emp_ID);
		e.setDep_no(Dep_no);
		if(sex==1) {
			e.setEmp_sex("男");
		}else {
			e.setEmp_sex("女");
		}
		e.setEmp_birthday(birthday);
		int num = es.register(e);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('用户已存在 请重试！');window.location.href='emp/admin.jsp';</script>");
			}else {
				response.sendRedirect("emp/admin.jsp");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=merregister"})//商家注册账号√
	private void fun_merregister(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String mer_phone=request.getParameter("phone1");
		String Mer_no=request.getParameter("Mer_no");
		String Mer_legal=request.getParameter("Mer_legal");
		String Mer_address=request.getParameter("Mer_address");
		String Mer_pwd=request.getParameter("password1");
		//将获取的信息写入实体
		Merchant m=new Merchant();
		m.setMer_address(Mer_address);
		m.setMer_legal(Mer_legal);
		m.setMer_name(name);
		m.setMer_no(Mer_no);
		m.setMer_phone(mer_phone);
		m.setMer_pwd(Mer_pwd);
		int num = es.register(m);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('用户已存在 请重试！');window.location.href='Mer/authorization.jsp';</script>");
			}else {
				response.sendRedirect("Mer/account.jsp");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=forget"})//商家忘记密码√
	private void fun_forget(HttpServletRequest request, HttpServletResponse response) {
		String mer_no=request.getParameter("phone2");				//获取表单信息
		String mer_phone=request.getParameter("id");
		String mer_pwd=request.getParameter("password3");
		//将获取的信息写入实体
		Merchant m=new Merchant();
		m.setMer_phone(mer_phone);
		m.setMer_pwd(mer_pwd);
		m.setMer_no(mer_no);
		int num = es.forget(m);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('填写信息出错 请重试！');window.location.href='Mer/authorization.jsp';</script>");
			}else {
				response.sendRedirect("Mer/account.jsp");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=merforget"})//忘记密码√
	private void fun_merforget(HttpServletRequest request, HttpServletResponse response) {
		String Emp_no=request.getParameter("Emp_no1");				//获取表单信息
		String Emp_pwd=request.getParameter("password3");
		String Emp_ID=request.getParameter("Emp_ID1");
		//将获取的信息写入实体
		Employees e = new Employees();
		e.setEmp_no(Emp_no);
		e.setEmp_pwd(Emp_pwd);
		e.setEmp_ID(Emp_ID);
		int num = es.forget(e);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('填写信息出错 请重试！');window.location.href='emp/admin.jsp';</script>");
			}else {
				response.sendRedirect("emp/admin.jsp");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery"})//由待配送转变为配送中
	private void fun_delivery(HttpServletRequest request, HttpServletResponse response) {
		String Del_no=request.getParameter("Del_no");
		Delivery d = new Delivery();
		d.setDel_no(Del_no);
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		Employees e=new Employees();
		e.setEmp_no(Emp_no);
		int num = es.delivery(d);
		String info=es.job1(e);
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/job.jsp");		//跳转分拣员/配送员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery1"})//由配送中转为送达
	private void fun_delivery1(HttpServletRequest request, HttpServletResponse response) {
		String Del_no=request.getParameter("Del_no");
		Delivery d = new Delivery();
		d.setDel_no(Del_no);
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		Employees e=new Employees();
		e.setEmp_no(Emp_no);
		int num = es.delivery1(d);
		String info=es.job1(e);
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/job.jsp");		//跳转分拣员/配送员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery2"})//刷新用户是否已确认
	private void fun_delivery2(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		Employees e=new Employees();
		e.setEmp_no(Emp_no);
		String info=es.job1(e);
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/job.jsp");		//跳转分拣员/配送员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=sort"})//分拣状态由待分拣变为分拣完成
	private void fun_sort(HttpServletRequest request, HttpServletResponse response) {
		String Sor_no=request.getParameter("Sor_no");
		Sort s = new Sort();
		s.setSor_no(Sor_no);
		int num=es.sort(s);
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		Employees e=new Employees();
		e.setEmp_no(Emp_no);
		String info=es.job2(e);
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/job.jsp");		//跳转分拣员/配送员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=saveemp"})
	private void fun_saveemp(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		String depno=(String)ss.getAttribute("depno");
		String name=request.getParameter("name");
		Employees e=new Employees();
		e.setEmp_name(name);
		e.setEmp_no(Emp_no);
		int num=es.UpdateEmp(e);
		try {
			ss.setAttribute("empdetail", es.detail(e));
			if(num==0) {
				if(depno.equals("1")) {
					response.getWriter().print("<script>alert('保存失败 请重试！');window.location.href='emp/job.jsp';</script>");
				}else {
					response.getWriter().print("<script>alert('保存失败 请重试！');window.location.href='emp/authorization.jsp';</script>");
				}
			}else {
				if(depno.equals("1")) {
					response.sendRedirect("emp/job.jsp");
				}else {
					response.sendRedirect("emp/authorization.jsp");
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=saveMer"})
	private void fun_saveMer(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Mer_no=(String)ss.getAttribute("Mer_no");
		String name=request.getParameter("name");
		String Mer_legal=request.getParameter("Mer_legal");
		String Mer_phone=request.getParameter("Mer_phone");
		String email=request.getParameter("email");
		String Mer_address=request.getParameter("Mer_address");
		Merchant m=new Merchant();
		m.setMer_address(Mer_address);
		m.setMer_email(email);
		m.setMer_legal(Mer_legal);
		m.setMer_name(name);
		m.setMer_no(Mer_no);
		m.setMer_phone(Mer_phone);
		int num=es.UpdateMer(m);
		try {
			if(num==0) {
				response.getWriter().print("<script>alert('保存失败 请重试！');window.location.href='Mer/account.jsp';</script>");
			}else {
				ss.setAttribute("empdetail", es.MerDetail(m));
				response.sendRedirect("Mer/account.jsp");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=pwdchange"})
	private void fun_pwdchange(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Mer_no=(String)ss.getAttribute("Mer_no");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		Merchant oldm=new Merchant();
		Merchant newm=new Merchant();
		oldm.setMer_pwd(oldpassword);
		oldm.setMer_no(Mer_no);
		newm.setMer_pwd(newpassword);
		newm.setMer_no(Mer_no);
		int num=es.changepwd(oldm,newm);
		try {
			if(num==2) {
				response.getWriter().print("<script>alert('密码错误 请重试！');window.location.href='emp/job.jsp';</script>");
			}else if(num==1){
				response.getWriter().print("<script>alert('更新成功 请重新登录！');</script>");
				fun_logout(request, response);
			}else {
				response.getWriter().print("<script>alert('更新失败 请重试！');window.location.href='emp/job.jsp';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=merpwdchange"})
	private void fun_merpwdchange(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Emp_no");
		String depno=(String)ss.getAttribute("depno");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		Employees olde=new Employees();
		Employees newe=new Employees();
		olde.setEmp_no(Emp_no);
		olde.setEmp_pwd(oldpassword);
		newe.setEmp_no(Emp_no);
		newe.setEmp_pwd(newpassword);
		int num=es.changepwd(olde,newe);
		try {
			if(depno.equals("1")) {
				if(num==2) {
					response.getWriter().print("<script>alert('密码错误 请重试！');window.location.href='emp/job.jsp';</script>");
				}else if(num==1){
					response.getWriter().print("<script>alert('更新成功 请重新登录！');</script>");
					fun_logout(request, response);
				}else {
					response.getWriter().print("<script>alert('更新失败 请重试！');window.location.href='emp/job.jsp';</script>");
				}
			}else {
				if(num==2) {
					response.getWriter().print("<script>alert('密码错误 请重试！');window.location.href='emp/authorization.jsp';</script>");
				}else if(num==1){
					response.getWriter().print("<script>alert('更新成功 请重新登录！');</script>");
					fun_logout(request, response);
				}else {
					response.getWriter().print("<script>alert('更新失败 请重试！');window.location.href='emp/authorization.jsp';</script>");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function="})
	private void fun_(HttpServletRequest request, HttpServletResponse response) {
	}
}
