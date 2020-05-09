package pl.ksiegarnia.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.service.ProductUserService;

@Controller
@RequestMapping(value = "/product")
public class ProductUserController {

	@Autowired
	ProductUserService service;

	@RequestMapping("")
	public ModelAndView hellolWorld() {
		List<Book> list = service.getAll();
		return new ModelAndView("products", "lista", list);
	}

	@RequestMapping("/rsw")
	public ModelAndView getone() {
		Book book = service.getBookbyId(1);
		return new ModelAndView("product", "lista", book);
	}

	@RequestMapping(value = "/cost", method = RequestMethod.POST)
	public ModelAndView CostControll(HttpServletRequest req) {
		String min = req.getParameter("min");
		String max = req.getParameter("max");
		ModelAndView modelAndView = new ModelAndView("welcome");
		List<Book> getBooksbyCost = service.GetBooksbyCost(Integer.valueOf(min), Integer.valueOf(max));
		modelAndView.addObject("lista", getBooksbyCost);
		return modelAndView;
	}

	public ModelAndView CostControllByCriteria(@MatrixVariable(pathVar = "cost") Map<String, String> params) {
		List<Book> books = service.GetBooksbyCost(Integer.valueOf(params.get("min")),
				Integer.valueOf(params.get("max")));
		ModelAndView modelAndView = new ModelAndView("products");
		modelAndView.addObject("lista", books);
		return modelAndView;
	}

	@RequestMapping(value = "/{cost}")
	public ModelAndView CostandCatControllByCriteria(@MatrixVariable(pathVar = "cost") Map<String, String> params,
			@RequestParam("cat") String cat) {
		List<Book> books = service.GetBooksbyCostandCat(Integer.valueOf(params.get("min")),
				Integer.valueOf(params.get("max")), cat);
		ModelAndView modelAndView = new ModelAndView("products");
		modelAndView.addObject("lista", books);
		return modelAndView;
	}

	@RequestMapping("/cat/{category}")
	public ModelAndView CatControl(@PathVariable("category") String category) {
		ModelAndView modelAndView = new ModelAndView("products");
		List<Book> book = service.GetBooksbyCategory(category);
		modelAndView.addObject("lista", book);
		return modelAndView;
	}

	@RequestMapping(value = "/dodajdokoszyka", method = RequestMethod.POST)
	public String dodajdokoszyka(HttpServletRequest req) {
		String id = req.getParameter("id");
		String ilosc = req.getParameter("ilosc");
		service.kup(Integer.valueOf(id), Integer.valueOf(ilosc));
		return "redirect:/product";
	}

}
