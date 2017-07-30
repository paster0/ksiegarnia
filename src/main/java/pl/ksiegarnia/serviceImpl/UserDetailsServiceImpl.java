package pl.ksiegarnia.serviceImpl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pl.ksiegarnia.model.Authority;
import pl.ksiegarnia.model.User;
import pl.ksiegarnia.repository.UserRepository;
import pl.ksiegarnia.security.CustomUserDetails;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	UserRepository userRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		User user = userRepo.findByEmail(email);
		if(user == null)
			throw new UsernameNotFoundException("User with email: "+email+" not found");
		
		
		
		return new CustomUserDetails(user);
	}

}
