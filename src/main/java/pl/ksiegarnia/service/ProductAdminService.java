package pl.ksiegarnia.service;



import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import pl.ksiegarnia.model.Book;

public interface ProductAdminService
{
	public List<Book> getAll();
	public void dropBookFromList(int id);
	public void dodaj(Book book);
	public void addImg(MultipartFile file, Book book, String realPath) throws IOException ;


}
