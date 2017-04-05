package pl.ksiegarnia.service;

import java.util.List;

import pl.ksiegarnia.model.User;

public interface UserAdminService 
{

	public boolean findUser();
	public List<User> GetuserList();

}
