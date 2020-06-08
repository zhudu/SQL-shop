package shop.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.service.Userservice;

@Controller
public class UserControl {
	@Autowired
	private Userservice us;
	
	@RequestMapping(value="/usercontrol", params= {"function=login"})
	private void fun_login(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=logout"})
	private void fun_logout(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=search"})
	private void fun_search(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=insert"})
	private void fun_insert(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=update"})
	private void fun_update(HttpServletRequest request, HttpServletResponse response) {
	}
	
	@RequestMapping(value="/usercontrol", params= {"function=delete"})
	private void fun_delete(HttpServletRequest request, HttpServletResponse response) {
	}
}
