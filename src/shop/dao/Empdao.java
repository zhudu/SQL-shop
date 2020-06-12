package shop.dao;


import java.util.List;

import shop.entity.Addres;
import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Form;
import shop.entity.Goods;
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

}
