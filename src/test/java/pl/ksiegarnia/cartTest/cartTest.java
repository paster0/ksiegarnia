package pl.ksiegarnia.cartTest;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

import junit.framework.Assert;
import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.CartItem;

@RunWith(MockitoJUnitRunner.class)
public class cartTest {
	Book[] books = new Book[5];



	CartItem[] cartItem;

	@Before
	public void przygotuj() {
		books = new Book[5];
		
		books[0] = new Book.Builder().idksiazki(1).imieautora("Jan").nazwiskoautora("Michalak")
				.tutyl("Zaawansowane programowanie w PHP").ilosc(4).cena(52f).build();

		books[1] = new Book.Builder().idksiazki(2).imieautora("Jan").nazwiskoautora("Michalak")
				.tutyl("Windows 8 PL. Zaawansowana administracja systemem").ilosc(4).cena(54f).build();

		books[2] = new Book.Builder().idksiazki(3).imieautora("Jan").nazwiskoautora("Michalak")
				.tutyl("HTML5. Tworzenie witryn").ilosc(4).cena(49f).build();

		books[3] = new Book.Builder().idksiazki(4).imieautora("Jan").nazwiskoautora("Michalak")
				.tutyl("Urządzenia techniki komputerowej").ilosc(4).cena(37f).build();

		books[4] = new Book.Builder().idksiazki(5).imieautora("Jan").nazwiskoautora("Michalak")
				.tutyl("PHP. Tworzenie nowoczesnych stron WWW").ilosc(4).cena(32f).build();

		cartItem = new CartItem[5];
		cartItem[0] = new CartItem(books[0]);
		cartItem[1] = new CartItem(books[1]);
		cartItem[2] = new CartItem(books[2]);
		cartItem[3] = new CartItem(books[3]);
		cartItem[4] = new CartItem(books[4]);

		books[0].getCena();
	}

	@Test
	public void grandTotalPriceTest() {
		Map<String, CartItem> cI = new HashMap<String, CartItem>();
		float grandTotal = 0;
		int[] bookq = new int[5];
		int c = 0;
		bookq[0] = 1;
		bookq[1] = 2;
		bookq[2] = 3;
		bookq[3] = 2;
		bookq[4] = 1;

		for (int i = 0; i < cartItem.length; i++)
		{
			cartItem[i].setQuantity(bookq[i]);
			cartItem[i].setTotalPrice(bookq[i]*books[i].getCena());
			cI.put(String.valueOf(books[i].getIdksiazki()), cartItem[i]);

            c = (int) books[i].getCena();
			c = bookq[i]*c;
			grandTotal += c;
			c = 0;
		}

		Cart cart = new Cart();
		cart.setCartItems(cI);
		cart.updateGrandTotal();
		
		Assert.assertTrue(grandTotal==cart.getGrandTotal());

	//	Assert.assertEquals(message, expected, actual, delta);

	}

}
