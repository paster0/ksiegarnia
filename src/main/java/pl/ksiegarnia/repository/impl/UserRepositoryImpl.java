package pl.ksiegarnia.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.mapping.List;
import org.springframework.stereotype.Repository;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository
{
	
	
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User loggin(String email) {
		Query query = entityManager.createQuery("select k from User k where k.email LIKE :email");
		query.setParameter("email", email);
		User res = (User) query.getSingleResult();
		return res;
		
	}

	@Transactional
	public void addUser(User user)
	{
		entityManager.persist(user);
		
		
	}

}
