package pl.ksiegarnia.repository;



import java.util.List;

import pl.ksiegarnia.model.User;

public interface UserRepository
{
	public List<User> getAllUsers();
	public void addUser(User user);
	User loggin(String email);

}
