package pl.ksiegarnia.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	@RequestMapping
	public String get(HttpServletRequest request) {
		return "redirect:/cart/" + request.getSession(true).getId();
	}

	@RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
	public ModelAndView getCart(@PathVariable(value = "cartId") String cartId, Model model) {
		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addObject("cartId", cartId);
		modelAndView.addObject("d", "takie zycie");
		return modelAndView;
	}
}