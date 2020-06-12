package shop.dao;

import java.util.List;

import shop.entity.Addres;
import shop.entity.Client;
import shop.entity.Delivery;
import shop.entity.Form;
import shop.entity.Goods;
import shop.entity.Sort;

public interface Userdao {

	List<Client> login(Client c);

	int register(Client c);

	int forget(Client c);

	List<Addres> Address(String phone);

	List<Form> Form(String phone);

	List<Goods> Form2Goods(String goo_no);

	List<Sort> Form2Sort(String for_no);

	List<Delivery> Sort2Delivery(String sor_no);

	int addAddress(Addres a);

	int Addressno(String no);

	int Clientcheck(Client c);

	int UpdateClient(Client c);

	int checkpwd(Client c);

	int changepwd(Client c);

	int deleteadd(Addres a);

}
