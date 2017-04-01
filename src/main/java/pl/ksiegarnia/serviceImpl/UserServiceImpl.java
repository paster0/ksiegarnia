package pl.ksiegarnia.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;
import pl.ksiegarnia.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository repository;

	@Override
	@Transactional
	public User loggin(String email, String haslo) {
try{
		User user = repository.loggin(email);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		boolean matches = passwordEncoder.matches(haslo, user.getHaslo());
		if (matches) {

			System.out.println("znalazlem cie");
			return user;
		}}
catch (Exception e) {
	return null;
}
return null;

		

	}

	/**This method add new user to the Database */
	@Override
	public void addUser(User user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
		String h = passwordEncoder.encode(user.getHaslo());
		user.setHaslo(h);
		repository.addUser(user);

	}

}
