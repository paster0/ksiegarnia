package pl.ksiegarnia.service;

import pl.ksiegarnia.model.User;

public interface UserService
{
	/** check if searched user exist in database */
public User loggin(String email, String haslo);
/** This method add new user to Database */
public void addUser(User user);

	
	
}
