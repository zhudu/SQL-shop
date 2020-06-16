package shop.dao;

import java.util.List;

import shop.entity.Client;
import shop.entity.Employees;
import shop.entity.Goods;
import shop.entity.Merchant;

public interface Admdao {

	int insert(Client c);

	int update(Client c);

	int insert(Employees e);

	int update(Employees e);

	int insert(Goods g);

	int update(Goods g);

	int insert(Merchant m);

	int update(Merchant m);

	int userdelete(String id);

	int empdelete(String id);

	int goodelete(String id);

	int merdelete(String id);

	List<Client> ClientDetail(String id);

	List<Merchant> MerDetail(String id);

	List<Goods> GooDetail(String id);

	List<Employees> EmpDetail(String id);

}
