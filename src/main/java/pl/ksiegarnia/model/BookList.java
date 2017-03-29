package pl.ksiegarnia.model;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;




@XmlRootElement(name = "lista")
@XmlSeeAlso({ Book.class })
public class BookList
{
	List<Book> bookList;
	
	public BookList(){}
	
	public BookList(List<Book> lista){
		this.bookList = lista;
		
	}

	@XmlElement
	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}



}
