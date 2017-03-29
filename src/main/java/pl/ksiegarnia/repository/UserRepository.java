package pl.ksiegarnia.repository;


import org.hibernate.mapping.List;

import pl.ksiegarnia.model.User;

public interface UserRepository
{
	public List getAllUsers();
	public void addUser(User user);
	User loggin(String email);

}
