package pl.ksiegarnia.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.serviceImpl.ProductUserServiceImpl;

@Controller
public class HomeController {
	@Autowired
	ProductUserServiceImpl product;

	@RequestMapping("/")
	public ModelAndView helloWorld() {
		List<Book> list = product.getAll();
		return new ModelAndView("welcome", "lista", list);
	}
}