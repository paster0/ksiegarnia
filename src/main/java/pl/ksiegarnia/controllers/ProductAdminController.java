package pl.ksiegarnia.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.service.ProductAdminService;
import pl.ksiegarnia.service.ProductUserService;

@Controller
@RequestMapping(value = "/admin")
public class ProductAdminController {

	@Autowired
	ProductAdminService service;
	@Autowired
	ProductUserService uservice;

	@RequestMapping(value = "")
	public ModelAndView hellolWorld() {

		return new ModelAndView("adminPanel");
	}

	@RequestMapping(value = "/drop", method = RequestMethod.POST)
	public String drop(HttpServletRequest req) {
		String idksiazki = req.getParameter("id");
		int id = Integer.valueOf(idksiazki);
		service.dropBookFromList(id);
		return "redirect:/admin";
	}

	@RequestMapping("/product/addBook")
	public ModelAndView addBookGet()

	{
		ModelAndView modelAndView = new ModelAndView("addBook");
		modelAndView.addObject("book", new Book.Builder().build());
		return modelAndView;
	}

	@InitBinder
	public void dataBinding(WebDataBinder binder, HttpServletRequest req) {
	}

	@RequestMapping(value = "/product/addBook", method = RequestMethod.POST)
	public String addBookPost(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpServletRequest req) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "addBook";
		}
		req.getSession().setAttribute("book", book);
		return "uploadform";
	}

	@RequestMapping(value = "/product/addBook/addimg", headers = ("content-type=multipart/*"), method = RequestMethod.POST)
	public String addBook(@RequestParam MultipartFile file, HttpServletRequest req) throws IOException {
		// System.out.println(file.getOriginalFilename());
		Book book = (Book) req.getSession().getAttribute("book");
		service.dodaj(book);
		String realPatch = req.getSession().getServletContext().getRealPath("");
		service.addImg(file, book, realPatch);
		return "redirect:/";
	}

	@RequestMapping(value = "/product")
	public ModelAndView products() {
		List<Book> list = service.getAll();
		return new ModelAndView("adminBook", "lista", list);
	}

	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public ModelAndView updateBook(HttpServletRequest req) {
		String idksiazki = req.getParameter("id");
		req.getSession().setAttribute("id", idksiazki);
		Book book = uservice.getBookbyId(Integer.valueOf(idksiazki));
		return new ModelAndView("updateBook", "book", book);
	}

	@RequestMapping(value = "/product/update/add", method = RequestMethod.POST)
	public ModelAndView updateBookPost(@Valid @ModelAttribute("book") Book book, HttpServletRequest req) {
		int idksiazki = Integer.valueOf((String) req.getSession().getAttribute("id"));
		service.updateBook(idksiazki, book);
		return new ModelAndView("adminBook");
	}

}
