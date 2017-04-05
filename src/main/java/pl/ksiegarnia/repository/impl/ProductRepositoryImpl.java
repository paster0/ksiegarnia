package pl.ksiegarnia.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl implements ProductRepository
{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Book> getAllProducts() 
	{
		return jdbcTemplate.query("select * from ksiazki", new maper() );
	}
	
	static class maper implements RowMapper<Book>
	
	{
		public Book mapRow(ResultSet rs, int rowNum) throws SQLException
		{	
			
			Book book = new Book.Builder()
					.idksiazki(rs.getInt("idksiazki"))
					.imieautora(rs.getString("imieautora"))
					.nazwiskoautora(rs.getString("nazwiskoautora"))
					.tutyl(rs.getString("tytul"))
					.cena(rs.getFloat("cena"))
					.ilosc(rs.getInt("ilosc"))
					.build();
					
			return book;
		}
		
	}
	

	@Override
	public Book getProductById(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject("select * from ksiazki where idksiazki = ?",
				new maper(), id);
	}
	
	
	public int getIdFromProduct(String imieautora, String nazwiskoautora, String tytul, float cena, int ilosc) 
	{
		return jdbcTemplate.queryForObject("select idksiazki from ksiazki where imieautora = ? "
				+ "AND nazwiskoautora = ?"
				+ "AND tytul = ?"
				+ "AND cena = ?"
				+ "AND ilosc = ? ", Integer.class, imieautora, nazwiskoautora, tytul, cena, ilosc);
			//	.queryForObject("select * from ksiazki where idksiazki = ?", imieautora);
	}
	
	
	
	public void zmniejsz(int id, int ilosc)
	{
		jdbcTemplate.update("UPDATE ksiazki SET ilosc = ilosc - ? WHERE idksiazki = ?", ilosc, id);
	}
	
	public void dodaj(Book book)
	{
		jdbcTemplate.update("INSERT INTO ksiazki(imieautora, nazwiskoautora, tytul, cena, ilosc) VALUES(?, ?, ?, ?, ?)"
				,book.getImieautora(), book.getNazwiskoautora(),
				book.getTytul(), book.getCena(), book.getIlosc());
	}


	@Override
	public void dropBookFromList(Book book)
	{
		int id = book.getIdksiazki();
		jdbcTemplate.update("delete from ksiazki where idksiazki = ?", id);
		
	}


	@Override
	public void updateBook(Book book) 
	{
		jdbcTemplate.update("UPDATE ksiazki SET cena=?, ilosc=?, imieautora=?, nazwiskoautora=?, tytul = ? WHERE idksiazki = ?", book.getCena(),
				book.getIlosc(), book.getImieautora(), book.getNazwiskoautora(), book.getTytul(), book.getIdksiazki());

	}

}
