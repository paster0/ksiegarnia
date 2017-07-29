package pl.ksiegarnia.security;

import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.security.core.userdetails.UserDetails;

import pl.ksiegarnia.model.Authority;
import pl.ksiegarnia.model.User;

public class CustomUserDetails extends User implements UserDetails {
	
	

	public CustomUserDetails(User user) {
BeanUtils.copyProperties(user, this);
	
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Set<Authority> getAuthorities() 
	{
		return super.getAuthorities();
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getHaslo();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return super.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
