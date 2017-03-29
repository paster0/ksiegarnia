package pl.ksiegarnia.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class OrderItem 
{
	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", ilosc=" + ilosc + ", book=" + book + "]";
	}

	public OrderItem(int ilosc, Book book) {
		super();
		this.ilosc = ilosc;
		this.book = book;
	}

	@Id
	@GeneratedValue
	private long id;
	private int ilosc;
	@ManyToOne
	@JoinColumn(name = "book_id")
	Book book;
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getIlosc() {
		return ilosc;
	}

	public void setIlosc(int ilosc) {
		this.ilosc = ilosc;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}



	

}
