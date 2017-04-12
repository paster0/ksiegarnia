package pl.ksiegarnia.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.service.UserAdminService;

@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController {

	@Autowired
	UserAdminService service;

	@RequestMapping(value = "")
	public ModelAndView hellol() {
		ModelAndView mav = new ModelAndView("adminUsers");
		List<User> list = service.GetuserList();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest req) {
		String idksiazki = req.getParameter("id");
		long id = Long.parseLong(idksiazki);
		User user = service.getUserById(id);
		ModelAndView mav = new ModelAndView("updateUser");
		mav.addObject("uUser", user);
		req.getSession().setAttribute("user", user);
		return mav;
	}

	@RequestMapping(value = "/update/exe", method = RequestMethod.POST)
	public String saveUpdateUser(@ModelAttribute("uUser") User uUser, HttpServletRequest req) {

		User user = (User) req.getSession().getAttribute("user");
		user.setEmail(uUser.getEmail());
		user.setImie(uUser.getImie());
		user.setNazwisko(uUser.getNazwisko());
		user.setAdres(uUser.getAdres());
		service.saveUser(user);
		req.getSession().removeAttribute("user");

		return "redirect:/admin/user";
	}

}
