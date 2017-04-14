package pl.ksiegarnia.repository;

import java.util.List;

import pl.ksiegarnia.model.Order;
import pl.ksiegarnia.model.OrderItem;

public interface OrderRepository
{

	public void addOrder(Order order, List<OrderItem> orderItems);
    public List<Order> getNotDoneOrders();
    public List<Order> getDoneOrders();
    public void updateOrderStatusById(int OrderId, String newStatus);
}
