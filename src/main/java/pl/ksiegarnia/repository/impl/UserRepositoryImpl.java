package pl.ksiegarnia.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository
{
	
	
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<User> getAllUsers() {
		
		Query query = entityManager.createQuery("select k from User k");
		List<User> userList =  query.getResultList();
				

		return userList;
	}

	@Override
	public User loggin(String email) 
	{try
	{
		Query query = entityManager.createQuery("select k from User k where k.email LIKE :email");
		query.setParameter("email", email);
		User res = (User) query.getSingleResult();
		return res;
	}
	catch (Exception e) {
		return null;
	}
	}

	@Transactional
	public void addUser(User user)
	{
		entityManager.persist(user);
		
		
	}

}
