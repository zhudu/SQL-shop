package shop.dao.impl;

import java.util.List;

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
		String hql="update Client set Cli_birthday='"+c.getCli_birthday()+"',Cli_id='"+c.getCli_id()+"',Cli_name='"+c.getCli_name()+"',Cli_password='"+c.getCli_password()+"',Cli_sex='"+c.getCli_sex()+"' where Client='"+c.getCli_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int insert(Employees e) {
		sf.getCurrentSession().save(e);
		return 1;
	}

	@Override
	public int update(Employees e) {
		String hql="update Employees set Emp_name='"+e.getEmp_name()+"',Dep_no='"+e.getDep_no()+"',Emp_birthday='"+e.getEmp_birthday()+"',Emp_ID='"+e.getEmp_ID()+"',Emp_pwd='"+e.getEmp_pwd()+"',Emp_sex='"+e.getEmp_sex()+"' where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int insert(Goods g) {
		sf.getCurrentSession().save(g);
		return 1;
	}

	@Override
	public int update(Goods g) {
		String hql="update Goods set Goo_class='"+g.getGoo_class()+"',Goo_name='"+g.getGoo_name()+"',Goo_price='"+g.getGoo_price()+"',Mer_no='"+g.getMer_no()+"',Store='"+g.getStore()+"' where Goo_no='"+g.getGoo_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int insert(Merchant m) {
		sf.getCurrentSession().save(m);
		return 1;
	}

	@Override
	public int update(Merchant m) {
		String hql="update Merchant set Mer_address='"+m.getMer_address()+"',Mer_email='"+m.getMer_email()+"',Mer_legal='"+m.getMer_legal()+"',Mer_name='"+m.getMer_name()+"',Mer_phone='"+m.getMer_phone()+"' where Mer_no='"+m.getMer_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int userdelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Client where Cli_no='"+id+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int empdelete(String id) {
		String hql="exec proc_newWork '"+id+"'";
		Query q = sf.getCurrentSession().createSQLQuery(hql);
		int num=q.executeUpdate();
		return 1;
	}

	@Override
	public int goodelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Goods where Goo_no='"+id+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int merdelete(String id) {
		Query q = sf.getCurrentSession().createQuery("delete from Merchant where Mer_no='"+id+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public List<Client> ClientDetail(String id) {
		String hql="from Client where Cli_no='"+id+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Merchant> MerDetail(String id) {
		String hql="from Merchant where Mer_no='"+id+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Goods> GooDetail(String id) {
		String hql="from Goods where Goo_no='"+id+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Employees> EmpDetail(String id) {
		String hql="from Employees where Emp_no='"+id+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}
}
