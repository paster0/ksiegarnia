package pl.ksiegarnia.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;



@Entity
@Table(name = "klienci")
public class User {


	@Id
	@GeneratedValue
	@Column(name = "idklienta")
	private Long id;

@NotEmpty(message="pole nie moze byc puste")
	private String imie;
@NotEmpty(message="pole nie moze byc puste")
	private String nazwisko;
@NotEmpty(message="pole nie moze byc puste")
	private String adres;
@NotEmpty(message="pole nie moze byc puste")
@Email(message = "nieprawidlowy adres email")
	private String email;
@NotEmpty(message="pole nie moze byc puste")
	private String haslo;
private boolean enabled;




	public boolean isEnabled() {
	return enabled;
}
public void setEnabled(boolean enabled) {
	this.enabled = enabled;
}
	@Transient
	    private String retypeHaslo;
	 
	public String getRetypeHaslo() {
		return retypeHaslo;
	}
	public void setRetypeHaslo(String retypeHaslo) {
		this.retypeHaslo = retypeHaslo;
	}
	public String getHaslo() {
		return haslo;
	}
	public void setHaslo(String haslo) {
		this.haslo = haslo;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getImie() {
		return imie;
	}
	public void setImie(String imie) {
		this.imie = imie;
	}
	public String getNazwisko() {
		return nazwisko;
	}
	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}
	
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", imie=" + imie + ", nazwisko=" + nazwisko + ", adres=" + adres + ", email=" + email
				+ "]";
	}
	
	
}
