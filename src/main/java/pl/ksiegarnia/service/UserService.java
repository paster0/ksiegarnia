package pl.ksiegarnia.service;

import pl.ksiegarnia.model.User;

public interface UserService
{
public User loggin(String email, String haslo);
public void addUser(User user);

	
	
}
