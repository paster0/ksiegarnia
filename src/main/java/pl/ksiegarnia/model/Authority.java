package pl.ksiegarnia.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.springframework.security.core.GrantedAuthority;

import pl.ksiegarnia.model.User;

@Entity
public class Authority implements GrantedAuthority {

	/**
	 * 
	 */
	@Id
	@GeneratedValue
	private Long id;
	@ManyToOne
	private User user;
	private String role;
	private static final long serialVersionUID = 1L;

	
	public void setRole(String role) {
		this.role = role;
	}

	
	
	public Authority() {
	}



	public Authority(User user, String role) {
		this.user = user;
		this.role = role;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public void setAuthority(String role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return role;
	}

}
