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
	public boolean addOrder(Cart cart, User user) {

		double cena = 0;
		Order order = new Order();
		List<OrderItem> oItems = new ArrayList<OrderItem>();
		Map<String, CartItem> cartItems = cart.getCartItems();
	//	int ii = cartItems.size();
		for (CartItem cI : cartItems.values()) {
			
	//		System.out.println(cartItems.get(String.valueOf(i)));
			CartItem cartItem =cI;
			
			
			
			cena += cartItem.getTotalPrice();
			OrderItem orderItem = new OrderItem(cartItem.getQuantity(), cartItem.getBook());
			oItems.add(orderItem);

		}

		for (OrderItem ci : oItems) {
			if (ci.getBook().getIlosc() < ci.getIlosc()) {
				return false;
			}
		}
		order.setOrderItem(oItems);
		order.setUser(user);
		order.setUwagi("brak");
		order.setCena(cena);
		order.setAdres(user.getAdres());
		order.setStatus("oczekujacy");
		System.out.println(order.toString() + "---------------------------" + oItems.toString());
		repository.addOrder(order, oItems);

		return true;
		// repository.addOrder(order, orderItems);
	}

	@Override
	public List<Order> getNotDoneOrders() {
List<Order> orders = repository.getNotDoneOrders();
return orders;
	}

	@Override
	public List<Order> getDoneOrders() {
		List<Order> orders = repository.getDoneOrders();

return orders;
	}

}
