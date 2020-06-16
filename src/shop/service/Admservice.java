package shop.service;

import shop.entity.Client;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.entity.Merchant;

public interface Admservice {

	int useradd(Client c);

	int userupdate(Client c);

	int empadd(Employees e);

	int empupdate(Employees e);

	int gooadd(Goods g);

	int gooupdate(Goods g);

	int meradd(Merchant m);

	int merupdate(Merchant m);

	int userdelete(String id);

	int empdelete(String id);

	int goodelete(String id);

	int merdelete(String id);

	String ClientDetail(String id);

	String MerDetail(String id);

	String GooDetail(String id);

	String EmpDetail(String id);
}
