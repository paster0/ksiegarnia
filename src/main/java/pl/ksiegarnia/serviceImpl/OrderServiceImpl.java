package pl.ksiegarnia.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.CartItem;
import pl.ksiegarnia.model.Order;
import pl.ksiegarnia.model.OrderItem;
import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.OrderRepository;
import pl.ksiegarnia.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository repository;

	@Override
	public void addOrder(Cart cart, User user) {

		Order order = new Order();
		List<OrderItem> oItems = new ArrayList<OrderItem>();
		Map<String, CartItem> cartItems = cart.getCartItems();
		int ii = cartItems.size();
for(int i = 1; i<(ii+1); i++)
{
	CartItem cartItem = cartItems.get(String.valueOf(i));
OrderItem orderItem = new OrderItem(cartItem.getQuantity(), cartItem.getBook());
oItems.add(orderItem);
	
}
order.setOrderItem(oItems);
order.setUser(user);
order.setUwagi("brak");
repository.addOrder(order, oItems);
	//	repository.addOrder(order, orderItems);
	}

}
