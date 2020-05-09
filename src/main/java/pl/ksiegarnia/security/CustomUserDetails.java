package pl.ksiegarnia.security;

import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import pl.ksiegarnia.model.Authority;
import pl.ksiegarnia.model.User;

public class CustomUserDetails extends User implements UserDetails {

	public CustomUserDetails(User user) {
		BeanUtils.copyProperties(user, this);

	}

	private static final long serialVersionUID = 1L;

	@Override
	public Set<Authority> getAuthorities() {
		return super.getAuthorities();
	}

	@Override
	public String getPassword() {

		return super.getHaslo();
	}

	@Override
	public String getUsername() {
		return super.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
