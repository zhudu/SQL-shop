package shop.service;

import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Merchant;
import shop.entity.MerchantDetail;
import shop.entity.Sort;
import shop.entity.empjob;

public interface Empservice {

	empjob login(Employees e);

	int delivery(Delivery d);

	int delivery1(Delivery d);

	int sort(Sort s);

	int register(Employees e);

	int forget(Merchant m);
	
	String job1(Employees e);
	
	String job2(Employees e);
	
	String job3();

	String detail(Employees e);

	int UpdateEmp(Employees e);

	int changepwd(Employees olde, Employees newe);

	int changepwd(Merchant oldm, Merchant newm);

	MerchantDetail merlogin(Merchant m);

	String MerDetail(Merchant m);

	int forget(Employees e);

	int register(Merchant m);

	String search(String mer_no);

	int UpdateMer(Merchant m);

}
