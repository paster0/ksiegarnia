package pl.ksiegarnia.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
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

		for (OrderItem oi : orderItems) {
			entityManager.persist(oi);
		}
		entityManager.persist(order);

	}

	@Override
	@Transactional
	public List<Order> getNotDoneOrders() {
		Query query = entityManager.createQuery("Select o from Order o where o.status != 'zrealizowane'");
		List<Order> orders = query.getResultList();
		for (Order o : orders) {
			Hibernate.initialize(o.getOrderItem());
		}

		return orders;
	}

	@Override
	@Transactional
	public List<Order> getDoneOrders() {

		Query query = entityManager.createQuery("Select o from Order o where o.status ='zrealizowane'");
		List<Order> orders = query.getResultList();

		return orders;
	}

	@Override
	@Transactional
	public void updateOrderStatusById(int OrderId, String newStatus) {
		Query query = entityManager.createQuery("update Order set status = :status " + "where id = :id");
		query.setParameter("status", newStatus);
		long id = Long.valueOf(OrderId);
		query.setParameter("id", id);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public void updateCommentStatusById(int OrderId, String newComment)	
	{
		Query query = entityManager.createQuery("update Order set uwagi = :uwagi where id = :id");
		query.setParameter("uwagi", newComment);
		long id = Long.valueOf(OrderId);
		query.setParameter("id", OrderId);
		query.executeUpdate();
		
		
		
		
		

	}	
}
	
	
	
	


















	














	
	
	




























