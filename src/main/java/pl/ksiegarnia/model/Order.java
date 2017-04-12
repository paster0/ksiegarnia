package pl.ksiegarnia.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "zamowienia")
public class Order {
	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", orderItem=" + orderItem + ", cena=" + cena + ", uwagi=" + uwagi
				+ "]";
	}



	@Id
	@GeneratedValue
	private long id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	@OneToMany
	@JoinColumn(name = "zamowienie_id")
	List<OrderItem> orderItem;
    private double cena;
    private String adres;
    private String status;
    
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public double getCena() {
	return cena;
}

public void setCena(double cena) {
	this.cena = cena;
}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	private String uwagi;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public List<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}

	public String getUwagi() {
		return uwagi;
	}

	public void setUwagi(String uwagi) {
		this.uwagi = uwagi;
	}

}
