package pl.ksiegarnia.repository;

import java.util.List;

import pl.ksiegarnia.model.Book;

public interface ProductRepository {
	public List<Book> getAllProducts();

	public Book getProductById(int id);

	public void dodaj(Book book);

	public void dropBookFromList(Book book);

	public void zmniejsz(int id, int ilosc);

	public int getIdFromProduct(String imieautora, String nazwiskoautora, String tytul, float cena, int ilosc);

	public void updateBook(Book book);
}
