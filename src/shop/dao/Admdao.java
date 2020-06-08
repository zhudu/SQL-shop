package shop.dao;

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

}
