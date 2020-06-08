package shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.Userdao;
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
	
	
}
