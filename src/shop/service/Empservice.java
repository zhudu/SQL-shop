package shop.service;

import shop.entity.Delivery;
import shop.entity.Employees;
import shop.entity.Sort;

public interface Empservice {

	int login(Employees e);

	int delivery(Delivery d);

	int delivery1(Delivery d);

	int delivery2(Delivery d);

	int sort(Sort s);

}
