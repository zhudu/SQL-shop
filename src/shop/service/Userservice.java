package shop.service;

import shop.entity.Addres;
import shop.entity.Client;
import shop.entity.ClientDetail;
import shop.entity.Employees;

public interface Userservice {

	String search(String searchname);

	int register(Client c);

	int forget(Client c);

	ClientDetail login(Client c);
	
	String detail(Client c);

	String AddressDetail(String phone);

	String FormDetail(String phone);

	int addAddress(Addres a);

	int UpdateClient(Client c);

	int changepwd(Client oldc, Client newc);

	int deleteadd(Addres a);

}
