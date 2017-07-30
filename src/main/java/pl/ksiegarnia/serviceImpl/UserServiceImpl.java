package pl.ksiegarnia.serviceImpl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.ksiegarnia.model.Authority;
import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;
import pl.ksiegarnia.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final String DEFAULT_ROLE = "ROLE_USER";

	@Autowired
	UserRepository repository;



	@Override
	@Transactional
	public User loggin(String email, String haslo) {
		try {
			User user = repository.findByEmail(email);
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			boolean matches = passwordEncoder.matches(haslo, user.getHaslo());
			
			
			
			Authentication authentication =  new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
			
			
			if (matches) {

				// System.out.println("found you");
				return user;
			}
		} catch (Exception e) {
			return null;
		}
		return null;

	}

	/** This method add new user to the Database */
	@Override
	public void addUser(User user) {
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
		String h = passwordEncoder.encode(user.getHaslo());
		user.setHaslo(h);
		
		Authority auth = new Authority(user, "ROLE_USER");
		Set<Authority> authoritySet = new HashSet<Authority>();
		authoritySet.add(auth);
		user.setAuthorities(authoritySet);
		
		
		repository.save(user);

	}

	@Override
	public void addWithDefaultRole(User user) {
		user.setRola(DEFAULT_ROLE);
		user.setEnabled(true);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
		user.setHaslo(passwordEncoder.encode(user.getHaslo()));
		repository.save(user);

	}

}
