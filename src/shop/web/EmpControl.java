package shop.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Sort;
import shop.service.Empservice;

@Controller
public class EmpControl {
	@Autowired
	private Empservice es;
	
	@RequestMapping(value="/empcontrol", params= {"function=login"})//登录检查
	private void fun_login(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		String remember = request.getParameter("remember");
		Employees e = new Employees();
		e.setEmp_no(phone);
		e.setEmp_pwd(password);
		int status = es.login(e);		//获取员工部门信息
		try {
			if(status==0) {
				HttpSession ss = request.getSession();
				ss.setAttribute("hasLogin", "yes"); 
				response.sendRedirect("emp/authorization.jsp");		//跳转操作界面
			}else if (status==1) {
				
			
			}else {
				//返回登录界面
				response.getWriter().print("<script>alert('登录出错 请重试！');window.location.href='emp/admin.jsp';</script>");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=logout"})//登出
	private void fun_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		ss.removeAttribute("hasLogin");
		try {
			response.sendRedirect("emp/authorization.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=update"})//
	private void fun_update(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=register"})//注册账号
	private void fun_register(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=forget"})//忘记密码
	private void fun_forget(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery"})//由待配送转变为配送中
	private void fun_delivery(HttpServletRequest request, HttpServletResponse response) {
		String Del_no=request.getParameter("Del_no");
		Delivery d = new Delivery();
		d.setDel_no(Del_no);
		int num = es.delivery(d);
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery1"})//由配送中转为送达
	private void fun_delivery1(HttpServletRequest request, HttpServletResponse response) {
		String Del_no=request.getParameter("Del_no");
		Delivery d = new Delivery();
		d.setDel_no(Del_no);
		int num = es.delivery1(d);
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=delivery2"})//刷新用户是否已确认
	private void fun_delivery2(HttpServletRequest request, HttpServletResponse response) {
		String Del_no=request.getParameter("Del_no");
		Delivery d = new Delivery();
		d.setDel_no(Del_no);
		int num = es.delivery2(d);
	}
	
	@RequestMapping(value="/empcontrol", params= {"function=sort"})//分拣状态由待分拣变为分拣完成
	private void fun_sort(HttpServletRequest request, HttpServletResponse response) {
		String Sor_no=request.getParameter("Sor_no");
		Sort s = new Sort();
		s.setSor_no(Sor_no);
		int num=es.sort(s);
	}
	
	@RequestMapping(value="/empcontrol", params= {"function="})
	private void fun_(HttpServletRequest request, HttpServletResponse response) {
	}
}
