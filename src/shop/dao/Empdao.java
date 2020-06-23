package shop.dao;


import java.util.List;

import shop.entity.Addres;
import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Form;
import shop.entity.Goods;
import shop.entity.Merchant;
import shop.entity.Sort;

public interface Empdao {

	List<Employees> login(Employees e);

	int delivery(Delivery d);

	int delivery1(Delivery d);

	int sort(Sort s);

	List SearchSort(Employees e);

	List SearchDelivery(Employees e);

	List ClientList();

	List EmpList();

	List MerList();

	List GooList();

	List<Form> SearchForm(Sort s);

	List<Goods> SearchGoods(Form f);

	List<Addres> Searchaddres(Delivery d);

	int register(Employees e);

	int forget(Employees e);

	int empcheck(Employees e);

	int UpdateEmp(Employees e);

	int checkpwd(Employees e);

	int changepwd(Employees e);

	List<Merchant> merlogin(Merchant m);

	List<Goods> Mer2Goods(Merchant m);

	int forget(Merchant m);

	int mercheck(Merchant m);

	int register(Merchant m);

	int UpdateMer(Merchant m);

	int checkpwd(Merchant oldm);

	int changepwd(Merchant newm);

}
