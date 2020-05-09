package pl.ksiegarnia.model;

import java.util.Objects;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderItem {
	public OrderItem() {

	}

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

		return this == obj || obj instanceof OrderItem && Objects.equals(uuid, ((OrderItem) obj).uuid);
	}

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
