package shop.service;

import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Sort;
import shop.entity.empjob;

public interface Empservice {

	empjob login(Employees e);

	int delivery(Delivery d);

	int delivery1(Delivery d);

	int sort(Sort s);

	int register(Employees e);

	int forget(Employees e);
	
	String job1(Employees e);
	
	String job2(Employees e);
	
	String job3();

	String detail(Employees e);

	int UpdateEmp(Employees e);

	int changepwd(Employees olde, Employees newe);

}
