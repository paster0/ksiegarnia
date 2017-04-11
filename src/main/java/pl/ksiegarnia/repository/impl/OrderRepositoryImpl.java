package pl.ksiegarnia.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import pl.ksiegarnia.model.Order;
import pl.ksiegarnia.model.OrderItem;
import pl.ksiegarnia.repository.OrderRepository;

@Repository
public class OrderRepositoryImpl implements OrderRepository {

	@PersistenceContext
	EntityManager entityManager;



	@Override
	@Transactional
	public void addOrder(Order order, List<OrderItem> orderItems) {

		for(OrderItem oi : orderItems)
		{
			entityManager.persist(oi);
		}
		entityManager.persist(order);
		
	}



	@Override	
	public List<Order> getAllOrders() {
Query query = entityManager.createQuery("Select o from Order o");
	List<Order> orders = query.getResultList();
	
	return orders;
	}

}
