package shop.service;

import shop.entity.Addres;
import shop.entity.Cart;
import shop.entity.Client;
import shop.entity.ClientDetail;
import shop.entity.Employees;
import shop.entity.Form;
import shop.entity.Goods;

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

	String product(Goods g);

	String classfind(Goods g);

	int addcart(Cart c);

	int cartnum(String cli_no);

	String cart(String cli_no);

	int deletecart(Cart c);

	String checkoutaddress(String cli_no);

	String checkouttotal(String cli_no);

	String checkoutimg(String cli_no);

	String addaddress(Addres a);

	int addform(Form f);

	int updatecart(Cart c);

}
