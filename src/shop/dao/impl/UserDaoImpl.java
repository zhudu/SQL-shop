package shop.dao.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.Userdao;
import shop.entity.*;

@Repository("userdao")
@Transactional
public class UserDaoImpl implements Userdao{
	@Resource
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public  List<Client> login(Client c) {
		boolean re;
		String hql="from Client where Cli_no='"+c.getCli_no()+"' and Cli_password='"+c.getCli_password()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public int register(Client c) {
		sf.getCurrentSession().save(c);
		return 1;
	}

	@Override
	public int forget(Client c) {
		Query q = sf.getCurrentSession().createQuery("update Client set Cli_password ='"+c.getCli_password()+"' where Cli_no='"+c.getCli_no()+"' and Cli_id='"+c.getCli_id()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public List<Addres> Address(String phone) {
		String hql="from Addres where Cli_no = '"+phone+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Form> Form(String phone) {
		String hql="from Form where Cli_no = '"+phone+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Goods> Form2Goods(String goo_no) {
		String hql="from Goods where Goo_no = '"+goo_no+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Sort> Form2Sort(String for_no) {
		String hql="from Sort where For_no = '"+for_no+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Delivery> Sort2Delivery(String sor_no) {
		String hql="from Delivery where Sor_no = '"+sor_no+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public int addAddress(Addres a) {
		sf.getCurrentSession().save(a);
		return 1;
	}

	@Override
	public int Addressno(String no) {
		int re = 0;
		String hql="from Addres where Add_no='"+no+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?0:1;
		return re;
	}

	@Override
	public int Clientcheck(Client c) {
		int re = 0;
		String hql="from Client where Cli_no='"+c.getCli_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?0:1;
		return re;
	}

	@Override
	public int UpdateClient(Client c) {
		String hql="update Client set Cli_name='"+c.getCli_name()+"',Cli_name='"+c.getCli_name()+"' where Cli_no='"+c.getCli_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int checkpwd(Client c) {
		int re = 0;
		String hql="from Client where Cli_no='"+c.getCli_no()+"'and Cli_password='"+c.getCli_password()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?2:1;
		return re;
	}

	@Override
	public int changepwd(Client c) {
		String hql="update Client set Cli_password='"+c.getCli_password()+"' where Cli_no='"+c.getCli_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int deleteadd(Addres a) {
		String hql="delete Addres where Add_no='"+a.getAdd_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

}
