package pl.ksiegarnia.service;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.User;

public interface OrderService {
	
	public void addOrder(Cart cart, User user);

}
