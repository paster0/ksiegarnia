package pl.ksiegarnia.model;

import java.util.Objects;
import java.util.UUID;


public class CartItem 
{
	private Book book;
	private int quantity;
	private float totalPrice;
	
	public CartItem(){}
	public CartItem(Book book)
	{
		super();
		this.book = book;
		this.quantity = 1;
		this.totalPrice = book.getCena();
	}
	
	
	private String uuid = UUID.randomUUID().toString();

	public String getUuid() {
		return uuid;
	}

	@Override
	public int hashCode() {

		return Objects.hash(uuid);
	}

	@Override
	public boolean equals(Object obj) {

		return this == obj || obj instanceof CartItem && Objects.equals(uuid, ((CartItem) obj).uuid);
	}
	
	
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	@Override
	public String toString() {
		return "CartItem [book=" + book + ", quantity=" + quantity + ", totalPrice=" + totalPrice + "]";
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
