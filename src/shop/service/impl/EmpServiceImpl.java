package shop.service.impl;

import org.apache.derby.catalog.types.UDTAliasInfo;
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
	public int login(Employees e) {
		return ed.login(e);
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
	public int delivery2(Delivery d) {
		return ed.delivery2(d);
	}

	@Override
	public int sort(Sort s) {
		return ed.sort(s);
	}

}
