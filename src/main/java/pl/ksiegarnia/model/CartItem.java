package pl.ksiegarnia.model;

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
