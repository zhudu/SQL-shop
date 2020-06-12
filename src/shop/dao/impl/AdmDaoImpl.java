package shop.dao.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
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
		sf.getCurrentSession().save(c);
		return 1;
	}

	@Override
	public int update(Client c) {
		return 0;
	}

	@Override
	public int insert(Employees e) {
		sf.getCurrentSession().save(e);
		return 1;
	}

	@Override
	public int update(Employees e) {
		return 0;
	}

	@Override
	public int insert(Goods g) {
		sf.getCurrentSession().save(g);
		return 1;
	}

	@Override
	public int update(Goods g) {
		return 0;
	}

	@Override
	public int insert(Merchant m) {
		sf.getCurrentSession().save(m);
		return 1;
	}

	@Override
	public int update(Merchant m) {
		return 0;
	}

	@Override
	public int userdelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Client where Cli_no="+id);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int empdelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Employees where Emp_no="+id);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int goodelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Goods where Goo_no="+id);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int merdelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Merchant where Mer_no="+id);
		int num=q.executeUpdate();
		return num;
	}
}
