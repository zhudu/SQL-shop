package shop.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.Admdao;
import shop.entity.Client;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.entity.Merchant;

@Repository("admdao")
@Transactional
public class AdmDaoImpl implements Admdao{
	@Resource
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public int insert(Client c) {
		return 0;
	}

	@Override
	public int update(Client c) {
		return 0;
	}

	@Override
	public int insert(Employees e) {
		return 0;
	}

	@Override
	public int update(Employees e) {
		return 0;
	}

	@Override
	public int insert(Goods g) {
		return 0;
	}

	@Override
	public int update(Goods g) {
		return 0;
	}

	@Override
	public int insert(Merchant m) {
		return 0;
	}

	@Override
	public int update(Merchant m) {
		return 0;
	}

	@Override
	public int userdelete(String id) {
		return 0;
	}

	@Override
	public int empdelete(String id) {
		return 0;
	}

	@Override
	public int goodelete(String id) {
		return 0;
	}

	@Override
	public int merdelete(String id) {
		return 0;
	}
}
