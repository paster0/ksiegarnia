package pl.ksiegarnia.service;

import java.util.List;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.Order;
import pl.ksiegarnia.model.User;

public interface OrderService {
	public boolean addOrder(Cart cart, User user);
	public List<Order> getNotDoneOrders();
	public List<Order> getDoneOrders();

}
