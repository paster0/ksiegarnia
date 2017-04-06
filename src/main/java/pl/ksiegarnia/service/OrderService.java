package pl.ksiegarnia.service;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.User;

public interface OrderService {
	
	public boolean addOrder(Cart cart, User user);

}
