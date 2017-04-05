package pl.ksiegarnia.serviceImpl;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.repository.ProductRepository;
import pl.ksiegarnia.service.ProductUserService;

@Service
public class ProductUserServiceImpl implements ProductUserService {
	
	@Autowired
	ProductRepository repository;
	
	public Book getBookbyId(int id)
	{
		return repository.getProductById(id);
	}

	public List<Book> getAll() {
		List<Book> allProducts = repository.getAllProducts();
		//allProducts.sort(id);
		Collections.sort(allProducts, new Comparator<Book>(){
	        public int compare(Book b1, Book b2){
	        	
	        	
	                return b1.getNazwiskoautora().compareTo(b2.getNazwiskoautora());
	        }
	}
		);
		
		
		return allProducts;
	}

	public void kup(int id, int ilosc) {
		Book book = repository.getProductById(id);
		if (book.getIlosc() >= ilosc)
			repository.zmniejsz(id, ilosc);
	}

	public List<Book> GetBooksbyCategory(String category) {
		List<Book> allProducts = repository.getAllProducts();
		List<Book> FilterProducts = new ArrayList<Book>();
		for (Book book : allProducts) {
			String tytul = book.getTytul();

			if (tytul.contains(category)) {
				FilterProducts.add(book);
			}

		}

		return FilterProducts;

	}

	public List<Book> GetBooksbyCost(int minCost, int maxCost) {

		List<Book> allProducts = repository.getAllProducts();
		List<Book> FilterProducts = new ArrayList<Book>();

		for (Book book : allProducts) {
			float cost = book.getCena();

			if (cost >= minCost && cost <= maxCost) {
				FilterProducts.add(book);
			}

		}
		return FilterProducts;
	}

	public List<Book> GetBooksbyCostandCat(int minCost, int maxCost, String category) {
		List<Book> allProducts = repository.getAllProducts();
		List<Book> FilterProducts = new ArrayList<Book>();
		for (Book book : allProducts) {
			float cost = book.getCena();

			if (cost >= minCost && cost <= maxCost) {
				FilterProducts.add(book);
			}
			String tytul = book.getTytul();

			if (!tytul.contains(category)) {
				FilterProducts.remove(book);
			}

		}

		return FilterProducts;

	}
	int dodaj(int a, int b)
	{
		return a +b;
	}

	

	

}
