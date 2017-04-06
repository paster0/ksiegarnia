package pl.ksiegarnia.serviceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;
import pl.ksiegarnia.service.UserAdminService;

@Service
public class UserAdminServiceImpl implements UserAdminService {

	@PersistenceContext
	EntityManager entityManager;
	User user = new User();

	@Autowired
	UserRepository repository;
	@Override
	@Transactional
	
	
	
/** This method check if logging user exist */
	public boolean findUser() {
		Query query = entityManager.createQuery("select k from User k where k.email LIKE :email AND k.haslo LIKE :has");
		query.setParameter("email", "lukasz@gmail.com");
		query.setParameter("has", "123");
		// query.setParameter(0, "lukasz@gmail.com");
		//User res = (User) query.getSingleResult();
		//System.out.println(res.toString());
		// quer123");
		return false;
	}

	@Override
	public List<User> GetuserList() {
List<User> allUsers = (List<User>) repository.findAll();
		return allUsers;
	}

	/*
	 * @Override public void method() { EntityManagerFactory
	 * entityManagerFactory =
	 * Persistence.createEntityManagerFactory("ksiegarnia"); EntityManager
	 * entityManager = entityManagerFactory.createEntityManager();
	 * 
	 * EntityTransaction transaction = entityManager.getTransaction(); Book book
	 * = new Book.Builder().tutyl("afryka").imieautora("tomasz").nazwiskoautora(
	 * "Niegoda") .cena(44).ilosc(23).build();
	 * 
	 * transaction.begin(); entityManager.persist(book); transaction.commit();
	 * 
	 * 
	 * entityManager.close(); entityManagerFactory.close();
	 * 
	 * 
	 * 
	 * }
	 * 
	 */
}
