package shop.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.Admdao;
import shop.entity.Client;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.entity.Merchant;
import shop.service.Admservice;
@Service("admservice")
public class AdmServiceImpl implements Admservice{
	
	@Autowired
	private Admdao ad;
	public Admdao getAd() {
		return ad;
	}

	public void setAd(Admdao ad) {
		this.ad = ad;
	}

	@Override
	public int useradd(Client c) {
		return ad.insert(c);
	}

	@Override
	public int userupdate(Client c) {
		return ad.update(c);
	}

	@Override
	public int empadd(Employees e) {
		return ad.insert(e);
	}

	@Override
	public int empupdate(Employees e) {
		return ad.update(e);
	}

	@Override
	public int gooadd(Goods g) {
		return ad.insert(g);
	}

	@Override
	public int gooupdate(Goods g) {
		return ad.update(g);
	}

	@Override
	public int meradd(Merchant m) {
		return ad.insert(m);
	}

	@Override
	public int merupdate(Merchant m) {
		return ad.update(m);
	}

	@Override
	public int userdelete(String id) {
		return ad.userdelete(id);
	}

	@Override
	public int empdelete(String id) {
		return ad.empdelete(id);
	}

	@Override
	public int goodelete(String id) {
		return ad.goodelete(id);
	}

	@Override
	public int merdelete(String id) {
		return ad.merdelete(id);
	}


}
