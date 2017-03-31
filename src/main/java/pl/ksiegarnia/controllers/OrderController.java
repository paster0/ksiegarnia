package pl.ksiegarnia.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.User;
import pl.ksiegarnia.service.CartService;
import pl.ksiegarnia.service.OrderService;

@Controller
@RequestMapping(value = "/order")
public class OrderController
{
	@Autowired
	private CartService cartService;
	
	@Autowired
	OrderService service;
	
	@RequestMapping(value = "")
	public ModelAndView order(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
String id = session.getId();
Cart cart = cartService.read(id);
User user = (User) req.getSession().getAttribute("user");
if(user!=null)
{
service.addOrder(cart, user);
}
else
{
	ModelAndView mav = new ModelAndView("cart");
	String blad = "aby zlozyc zamowienie musisz byc zalogowany";
mav.addObject("blad", blad);
	return mav;
}
ModelAndView mav = new ModelAndView("welcome");

return mav;

	}
	

}
