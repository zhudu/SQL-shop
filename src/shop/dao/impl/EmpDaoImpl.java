package shop.dao.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.Empdao;
import shop.entity.*;

@Repository("empdao")
@Transactional
public class EmpDaoImpl implements Empdao{
	@Resource
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public List<Merchant> merlogin(Merchant m) {
		String hql="from Merchant where Mer_no='"+m.getMer_no()+"' and Mer_pwd='"+m.getMer_pwd()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Employees> login(Employees e) {
		String hql="from Employees where Emp_no='"+e.getEmp_no()+"' and Emp_pwd='"+e.getEmp_pwd()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//由待配送转变为配送中
	public int delivery(Delivery d) {
		Query q = sf.getCurrentSession().createQuery("update Delivery set Del_status =1 where Del_no='"+d.getDel_no()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override			//由配送中转为送达
	public int delivery1(Delivery d) {
		Query q = sf.getCurrentSession().createQuery("update Delivery set Del_status =2 where Del_no='"+d.getDel_no()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override			//分拣状态由待分拣变为分拣完成
	public int sort(Sort s) {
		Query q = sf.getCurrentSession().createQuery("update Sort set Sor_state =1 where Sor_no='"+s.getSor_no()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override			//枚举该员工对应的分拣单
	public List SearchSort(Employees e) {
		String hql="from Sort where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//枚举该员工的配送单
	public List SearchDelivery(Employees e) {
		String hql="from Delivery where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Goods> Mer2Goods(Merchant m) {
		String hql="from Goods where Mer_no='"+m.getMer_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//枚举用户
	public List ClientList() {
		String hql="from Client";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//枚举员工
	public List EmpList() {
		String hql="from Employees";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//枚举商家
	public List MerList() {
		String hql="from Merchant";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override			//枚举商品
	public List GooList() {
		String hql="from Goods";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		return rs;
	}

	@Override
	public List<Form> SearchForm(Sort s) {
		String hql="from Form where For_no='"+s.getFor_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List<Form> rs=q.list();
		return rs;
	}

	@Override
	public List<Goods> SearchGoods(Form f) {
		String hql="from Goods where Goo_no='"+f.getGoo_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List<Goods> rs=q.list();
		return rs;
	}

	@Override
	public List<Addres> Searchaddres(Delivery d) {
		String hql="from Addres where Add_no='"+d.getAdd_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List<Addres> rs=q.list();
		return rs;
	}

	@Override
	public int register(Employees e) {
		sf.getCurrentSession().save(e);
		return 1;
	}

	@Override
	public int register(Merchant m) {
		sf.getCurrentSession().save(m);
		return 1;
	}

	@Override
	public int forget(Employees e) {
		Query q = sf.getCurrentSession().createQuery("update Employees set Emp_pwd ='"+e.getEmp_pwd()+"' where Emp_no='"+e.getEmp_no()+"' and Emp_ID='"+e.getEmp_ID()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int forget(Merchant m) {
		Query q = sf.getCurrentSession().createQuery("update Merchant set Mer_pwd ='"+m.getMer_pwd()+"' where Mer_no='"+m.getMer_no()+"' and Mer_phone='"+m.getMer_phone()+"'");
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int empcheck(Employees e) {
		int re = 0;
		String hql="from Employees where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?0:1;
		return re;
	}

	@Override
	public int mercheck(Merchant m) {
		int re = 0;
		String hql="from Merchant where Mer_no='"+m.getMer_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?0:1;
		return re;
	}

	@Override
	public int UpdateEmp(Employees e) {
		String hql="update Employees set Emp_name='"+e.getEmp_name()+"' where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int UpdateMer(Merchant m) {
		String hql="update Merchant set Mer_address='"+m.getMer_address()+"' and Mer_email='"+m.getMer_email()+"' and Mer_legal='"+m.getMer_legal()+
					"' and Mer_name='"+m.getMer_name()+"' and Mer_phone='"+m.getMer_phone()+"' where Emp_no='"+m.getMer_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int checkpwd(Employees e) {
		int re = 0;
		String hql="from Employees where Emp_no='"+e.getEmp_no()+"'and Emp_pwd='"+e.getEmp_pwd()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?2:1;		//查询失败返回2，成功返回1
		return re;
	}

	@Override
	public int checkpwd(Merchant oldm) {
		int re = 0;
		String hql="from Merchant where Mer_no='"+oldm.getMer_no()+"'and Mer_pwd='"+oldm.getMer_pwd()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		List rs=q.list();
		re=rs.size()==0?2:1;		//查询失败返回2，成功返回1
		return re;
	}

	@Override
	public int changepwd(Employees e) {
		String hql="update Employees set Emp_pwd='"+e.getEmp_pwd()+"' where Emp_no='"+e.getEmp_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

	@Override
	public int changepwd(Merchant newm) {
		String hql="update Merchant set Mer_pwd='"+newm.getMer_pwd()+"' where Mer_no='"+newm.getMer_no()+"'";
		Query q=sf.getCurrentSession().createQuery(hql);
		int num=q.executeUpdate();
		return num;
	}

}
