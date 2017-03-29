package pl.ksiegarnia.serviceImpl;



import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.repository.ProductRepository;
import pl.ksiegarnia.service.ProductAdminService;


@Service
public class ProductAdminServiceImpl implements ProductAdminService 
{
	
	@Autowired
	ProductRepository repository;

	@Override
	public void dropBookFromList(int id)
	{
		Book book = repository.getProductById(id);
		repository.dropBookFromList(book);
		
	}

	@Override
	public List<Book> getAll() {
		List<Book> allProducts = repository.getAllProducts();
		//allProducts.sort(id);
		Collections.sort(allProducts, new Comparator<Book>(){
	        public int compare(Book b1, Book b2){
	        	
	        	
	                return b1.getNazwiskoautora().compareTo(b2.getNazwiskoautora());
	        }
	}
		);
		
		return allProducts;
	}
	
	public void dodaj(Book book) {
		repository.dodaj(book);
	}

	@Override
	public void addImg(MultipartFile file, Book book, String realPatch) throws IOException 
	{	
		int idksiazki = repository.getIdFromProduct(book.getImieautora(), book.getNazwiskoautora(), book.getTytul(), book.getCena(), book.getIlosc());
		String id = String.valueOf(idksiazki);
		byte[] bity = file.getBytes();
		InputStream in = new ByteArrayInputStream(bity);
		BufferedImage b = ImageIO.read(in);
		String patch = realPatch + "/resources/img/"+id+".jpg";
		File outfile = new File(patch);
		outfile.createNewFile();
		ImageIO.write(b, "JPG", outfile);
		
	}




}
