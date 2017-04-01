package pl.ksiegarnia.service;

import java.util.List;


import pl.ksiegarnia.model.Book;

public interface ProductUserService
{
	public List<Book> getAll();
	/**This method reduces the amount of selected book*/
	public void kup(int id, int ilosc);
	/** This books returns books only with "category" word in the title*/
	public List<Book> GetBooksbyCategory(String category);
	public List<Book> GetBooksbyCost(int minCost, int maxCost);
	public List<Book> GetBooksbyCostandCat(int minCost, int maxCost, String category);
	public Book getBookbyId(int id);
	


}
