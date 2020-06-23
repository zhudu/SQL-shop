package shop.web;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.service.Admservice;
import shop.service.Empservice;
import shop.entity.*;

@Controller
public class AdmControl {
	@Autowired
	private Admservice as;
	@Autowired
	private Empservice es;
	
	@RequestMapping(value="/admcontrol", params= {"function=insert"})
	private void fun_insert(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=update"})
	private void fun_update(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=delete"})
	private void fun_delete(HttpServletRequest request, HttpServletResponse response) {
	}

	@RequestMapping(value="/admcontrol", params= {"function=useradd"})//添加用户
	private void fun_useradd(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String phone=request.getParameter("phone");
		String Cli_id=request.getParameter("Cli_id");
		String password=request.getParameter("password");
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
		int num = as.useradd(c);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=user_update"})//显示待更新的用户信息
	private void fun_user_update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String info=as.ClientDetail(id);
		HttpSession ss = request.getSession();
		ss.setAttribute("clientDetail", info); 
		ss.setAttribute("Clino_temp", id); 
		try {
			response.sendRedirect("admin/Userupdate.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=userupdate"})//更新用户信息
	private void fun_userupdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String phone=(String)ss.getAttribute("Clino_temp");
		String name=request.getParameter("name");				//获取表单信息
		String Cli_id=request.getParameter("Cli_id");
		String password=request.getParameter("password");
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
		int num = as.userupdate(c);
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=empadd"})//添加员工
	private void fun_empadd(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String Emp_no=request.getParameter("Emp_no");
		String Emp_pwd=request.getParameter("Emp_pwd");
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
		int num = as.empadd(e);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=emp_update"})//显示待更新的员工信息
	private void fun_emp_update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String info=as.EmpDetail(id);
		HttpSession ss = request.getSession();
		ss.setAttribute("EmpDetail", info); 
		ss.setAttribute("Empno_temp", id); 
		try {
			response.sendRedirect("admin/Empupdate.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=empupdate"})//更新员工信息
	private void fun_empupdate(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		HttpSession ss = request.getSession();
		String Emp_no=(String)ss.getAttribute("Empno_temp");
		String Emp_pwd=request.getParameter("Emp_pwd");
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
		int num = as.empupdate(e);
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=gooadd"})//添加商品
	private void fun_gooadd(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String Goo_no=request.getParameter("Goo_no");
		double Goo_price=Double.parseDouble(request.getParameter("Goo_price")) ;
		String Store=request.getParameter("Store");
		String Mer_no=request.getParameter("Mer_no");
		String Goo_class=request.getParameter("Goo_class");
		String Goo_detail=request.getParameter("Goo_detail");
		String  file = request.getParameter("img");
		System.out.println(file);
		String new_adress="..\\eework\\sql_shop2\\WebContent\\img\\picture\\"+Goo_no+".jpg";
		try {
			BufferedImage image=ImageIO.read(new File(file));
			ImageIO.write(image, "jpg", new File(new_adress));
		} catch (IOException e) {
			e.printStackTrace();
		}
		String img="../img/picture/"+Goo_no+".jpg";
		System.out.println(name+Goo_no+Goo_price+Store+Mer_no+Goo_class);
		//将获取的信息写入实体
		Goods g=new Goods();
		g.setGoo_name(name);
		g.setGoo_no(Goo_no);
		g.setGoo_price(Goo_price);
		g.setStore(Store);
		g.setMer_no(Mer_no);
		g.setGoo_class(Goo_class);
		g.setGoo_detail(Goo_detail);
		g.setGoo_img(img);
		int num = as.gooadd(g);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("Mer/acount.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=goo_update"})//显示待更新的商品信息
	private void fun_goo_update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String info=as.GooDetail(id);
		HttpSession ss = request.getSession();
		ss.setAttribute("GooDetail", info); 
		ss.setAttribute("Goono_temp", id); 
		try {
			response.sendRedirect("admin/Gooupdate.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=gooupdate"})//更新商品信息
	private void fun_gooupdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Goo_no=(String)ss.getAttribute("Goono_temp");
		String name=request.getParameter("name");				//获取表单信息
		double Goo_price=Double.parseDouble(request.getParameter("Goo_price")) ;
		String Store=request.getParameter("Store");
		String Mer_no=request.getParameter("Mer_no");
		String Goo_class=request.getParameter("Goo_class");
		System.out.println(name+Goo_no+Goo_price+Store+Mer_no+Goo_class);
		//将获取的信息写入实体
		Goods g=new Goods();
		g.setGoo_name(name);
		g.setGoo_no(Goo_no);
		g.setGoo_price(Goo_price);
		g.setStore(Store);
		g.setMer_no(Mer_no);
		g.setGoo_class(Goo_class);
		int num = as.gooupdate(g);
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=meradd"})//添加商家
	private void fun_meradd(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");				//获取表单信息
		String Mer_no=request.getParameter("Mer_no");
		String Mer_legal=request.getParameter("Mer_legal");
		String Mer_address=request.getParameter("Mer_address");
		String Mer_phone=request.getParameter("Mer_phone");
		String Mer_email=request.getParameter("Mer_email");
		System.out.println(name+Mer_no+Mer_legal+Mer_address+Mer_phone+Mer_email);
		//将获取的信息写入实体
		Merchant m = new Merchant();
		m.setMer_name(name);
		m.setMer_no(Mer_no);
		m.setMer_legal(Mer_legal);
		m.setMer_address(Mer_address);
		m.setMer_phone(Mer_phone);
		m.setMer_email(Mer_email);
		int num = as.meradd(m);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=mer_update"})//显示待更新的商家信息
	private void fun_mer_update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String info=as.MerDetail(id);
		HttpSession ss = request.getSession();
		ss.setAttribute("MerDetail", info); 
		ss.setAttribute("Merno_temp", id); 
		try {
			response.sendRedirect("admin/Merupdate.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/admcontrol", params= {"function=merupdate"})//更新商家信息
	private void fun_merupdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String Mer_no=(String)ss.getAttribute("Merno_temp");
		String name=request.getParameter("name");				//获取表单信息
		String Mer_legal=request.getParameter("Mer_legal");
		String Mer_address=request.getParameter("Mer_address");
		String Mer_phone=request.getParameter("Mer_phone");
		String Mer_email=request.getParameter("Mer_email");
		System.out.println(name+Mer_no+Mer_legal+Mer_address+Mer_phone+Mer_email);
		//将获取的信息写入实体
		Merchant m = new Merchant();
		m.setMer_name(name);
		m.setMer_no(Mer_no);
		m.setMer_legal(Mer_legal);
		m.setMer_address(Mer_address);
		m.setMer_phone(Mer_phone);
		m.setMer_email(Mer_email);
		int num = as.merupdate(m);
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=userdelete"})//删除用户
	private void fun_userdelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int num = as.userdelete(id);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=empdelete"})//删除员工
	private void fun_empdelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int num = as.empdelete(id);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=goodelete"})//删除商品
	private void fun_goodelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int num = as.goodelete(id);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="/admcontrol", params= {"function=merdelete"})//删除商家
	private void fun_merdelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int num = as.merdelete(id);
		HttpSession ss = request.getSession();
		String info=es.job3();
		try {
			ss.setAttribute("empjob", info);		//将工作内容写入session属性
			response.sendRedirect("emp/authorization.jsp");		//跳转管理员操作界面
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
