package pl.ksiegarnia.serviceImpl;

import static org.mockito.Matchers.anyInt;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import junit.framework.Assert;
import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.repository.impl.ProductRepositoryImpl;

@RunWith(MockitoJUnitRunner.class)
public class ProductServiceTest {
	
			
	private Book book1;
	private Book book2;
	private Book book3;
	private Book book4;
	private Book book5;
	private List<Book> list;	
	@Mock
	private ProductRepositoryImpl repository;
			
	@InjectMocks
	private ProductUserServiceImpl service = new ProductUserServiceImpl();
	
	@Before
	public void przygotuj()
	{
		book1 = new Book.Builder().idksiazki(1).imieautora("Jan")
				.nazwiskoautora("Michalak")
				.tutyl("Zaawansowane programowanie w PHP")
				.ilosc(4).cena(52.02f).build();

		book2 = new Book.Builder().idksiazki(2).imieautora("Jan")
				.nazwiskoautora("Michalak")
				.tutyl("Windows 8 PL. Zaawansowana administracja systemem")
				.ilosc(4).cena(54.99f).build();
		
		book3 = new Book.Builder().idksiazki(3).imieautora("Jan")
				.nazwiskoautora("Michalak")
				.tutyl("HTML5. Tworzenie witryn")
				.ilosc(4).cena(49.02f).build();
	
		book4 = new Book.Builder().idksiazki(4).imieautora("Jan")
		.nazwiskoautora("Michalak")
		.tutyl("Urządzenia techniki komputerowej")
		.ilosc(4).cena(37.57f).build();
		
		book5 = new Book.Builder().idksiazki(5).imieautora("Jan")
		.nazwiskoautora("Michalak")
		.tutyl("PHP. Tworzenie nowoczesnych stron WWW")
		.ilosc(4).cena(32.99f).build();
		
		list = new ArrayList<Book>();
		list.add(book1);
		list.add(book2);
		list.add(book3);
		list.add(book4);
		list.add(book5);
		//System.out.println(list.toString());
		Mockito.when(repository.getAllProducts()).thenReturn(list);

	}
	
	@Test
	public void oneBookisObjectTest()
	{
//		Assert.assertEquals(1, service.dodaj(1, 1));
		Mockito.when(repository.getProductById(anyInt())).thenReturn(book1);
	//	Assert.assertTrue(repository.getProductById(1).getIlosc()==4);
	Assert.assertTrue(service.getBookbyId(1).getIlosc()==4);
	}
	
	@Test
	public void bookListCatTest()
	{
  Assert.assertTrue(service.GetBooksbyCategory("PHP").toString().contains("PHP"));
	
	}
	@Test
	public void bookListCostTest()
	{
		int min = 0;
		int max = 50;
	List<Book> lista = service.GetBooksbyCost(min, max);	
	ArrayList<Float> ceny = new ArrayList<Float>();
	for(Book book : lista)
	{
ceny.add(book.getCena());
	}
	boolean test = true;
	for(float cena : ceny)
	{
		if(cena>max) test = false;
		if(cena<min) test = false;
		
		
	}
	
	Assert.assertTrue(test);
	
	}
	

}
