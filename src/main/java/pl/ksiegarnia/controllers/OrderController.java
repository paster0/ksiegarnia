package pl.ksiegarnia.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.model.Order;
import pl.ksiegarnia.model.User;
import pl.ksiegarnia.service.CartService;
import pl.ksiegarnia.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	OrderService service;

	@RequestMapping(value = "/order")
	public ModelAndView order(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = session.getId();
		Cart cart = cartService.read(id);
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			boolean allOk = service.addOrder(cart, user);
			if (allOk == false) {
				ModelAndView mav = new ModelAndView("cart");
				String blad = "brak wystarczajacej ilosc produktow na skladzie";
				mav.addObject("blad", blad);
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView("cart");
			String blad = "aby zlozyc zamowienie musisz byc zalogowany";
			mav.addObject("blad", blad);
			return mav;
		}
		ModelAndView mav = new ModelAndView("welcome");
		return mav;
	}

	@RequestMapping(value = "/admin/order")
	public ModelAndView AdminOrder(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("adminOrder");
		List<Order> compOrders = service.getNotDoneOrders();
		mav.addObject("list", compOrders);
		// System.out.println(allOrders.toString());

		return mav;

	}

	@RequestMapping(value = "/admin/order/done")
	public ModelAndView AdminDoneOrder(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("adminDoneOrder");
		List<Order> doneOrders = service.getDoneOrders();
		mav.addObject("list", doneOrders);
		// System.out.println(allOrders.toString());
		return mav;
	}

	@RequestMapping(value = "/admin/order/updateStatus/{id}/{status}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void updateOrder(@PathVariable(value = "id") String id, @PathVariable(value = "status") String status) {
		service.updateOrderStatusById(Integer.valueOf(id), status);
	}

	@RequestMapping(value = "/admin/order/updateStatus/uwagi", method = RequestMethod.POST)
	public String updateComment(HttpServletRequest req) {
		String newComment = req.getParameter("uwagi");
		int OrderId = Integer.valueOf(req.getParameter("id"));
		service.updateCommentStatusById(OrderId, newComment);

		return "redirect:/admin/order";
	}

	@RequestMapping(value = "/admin/order/delete", method = RequestMethod.POST)
	public String deleteOrder(HttpServletRequest req) {

		Long orderId = Long.valueOf(req.getParameter("id"));

		service.deleteOrderById(orderId);
		return "redirect:/admin/order/done";
	}

}
