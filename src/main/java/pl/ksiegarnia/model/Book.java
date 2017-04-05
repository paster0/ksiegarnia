package pl.ksiegarnia.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "ksiazki")
@XmlRootElement
public class Book 
{
	//test
	@Override
	public String toString() {
		return "Book [idksiazki=" + idksiazki + ", imieautora=" + imieautora + ", tytul=" + tytul + ", nazwiskoautora="
				+ nazwiskoautora + ", cena=" + cena + ", ilosc=" + ilosc + "]";
	}

	@Id
	@GeneratedValue  
	private int idksiazki;
	private String imieautora; 
	private String tytul;
	private String nazwiskoautora;
	private float cena;	
    private int ilosc;

	
	//@Override
	//public String toString() {
	//	return "Book [idksiazki=" + idksiazki + ", imieautora=" + imieautora + ", nazwiskoautora=" + nazwiskoautora
//				+ ", tytul=" + tytul + ", cena=" + cena + ", ilosc=" + ilosc + "]";
//	}

	
	

	
	public void setIdksiazki(int idksiazki) {
		this.idksiazki = idksiazki;
	}

	
	public void setImieautora(String imieautora) {
		this.imieautora = imieautora;
	}
	
	public void setNazwiskoautora(String nazwiskoautora) {
		this.nazwiskoautora = nazwiskoautora;
	}
	
	
	public void setTytul(String tytul) {
		this.tytul = tytul;
	}
	

	public void setCena(float cena) {
		this.cena = cena;
	}


	
	
	public void setIlosc(int ilosc) {
		this.ilosc = ilosc;
	}

	
	
	
	
	@XmlElement
	public int getIdksiazki() {
		return idksiazki;
	}
	@XmlElement
	public String getImieautora() {
		return imieautora;
	}
	@XmlElement
	public String getNazwiskoautora() {
		return nazwiskoautora;
	}
	@XmlElement
	public String getTytul() {
		return tytul;
	}
	@XmlElement
	public float getCena() {
		return cena;
	}
	@XmlElement
	public int getIlosc() {
		return ilosc;
	}
public Book()
{
	
}

	
	private Book(Builder builder)
	{
	this.idksiazki=builder.idksiazki;
	this.imieautora=builder.imieautora;
	this.nazwiskoautora=builder.nazwiskoautora;
	this.tytul=builder.tytul;
	this.cena=builder.cena;
	this.ilosc=builder.ilosc;
		
	}
	
	public static class Builder
	{
		@Id
		@GeneratedValue
		private int idksiazki;
		private String imieautora;
		private String nazwiskoautora;
		private String tytul;
		private float cena;
		private int ilosc;
		
		public Builder idksiazki(int idksiazki)
		{
			this.idksiazki = idksiazki;
			return this;
		}
		 
		public Builder imieautora(String imieautora)
		{
			this.imieautora=imieautora;
			return this;
			
		}
		public Builder nazwiskoautora(String nazwiskoautora)
		{
			this.nazwiskoautora=nazwiskoautora;
			return this;
			
		}
		public Builder tutyl(String tytul)
		{
			this.tytul=tytul;
			return this;
			
		}
		public Builder cena(float cena)
		{
			this.cena=cena;
			return this;
			
		}
		public Builder ilosc(int ilosc)
		{
			this.ilosc=ilosc;
			return this;
			
		}
		public Book build()
		{
			return new Book(this);
		}
		
		
		
		
		
	
	}
	
	
	

}
