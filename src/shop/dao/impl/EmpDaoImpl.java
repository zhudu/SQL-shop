package shop.dao.impl;

import javax.annotation.Resource;

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
	public int login(Employees e) {
		return 0;
	}

	@Override			//由待配送转变为配送中
	public int delivery(Delivery d) {
		return 0;
	}

	@Override			//由配送中转为送达
	public int delivery1(Delivery d) {
		return 0;
	}

	@Override			//刷新用户是否已确认
	public int delivery2(Delivery d) {
		return 0;
	}

	@Override			//分拣状态由待分拣变为分拣完成
	public int sort(Sort s) {
		return 0;
	}

}
