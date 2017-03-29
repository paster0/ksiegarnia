package pl.ksiegarnia.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController

{

	@Autowired
	UserService service;

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/login")
	public String loggin(HttpServletRequest req) {
		String mail = req.getParameter("mail");
		String haslo = req.getParameter("haslo");
		User user = service.loggin(mail, haslo);
		if(user!=null)
		{
		System.out.println(user.toString());
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		}
		return "welcome";
	}
	
	@RequestMapping("/reg")
	public ModelAndView reg(HttpServletRequest req) {
		
		ModelAndView modelAndView = new ModelAndView("register");

		modelAndView.addObject("User", new User());
	
		return modelAndView;
	}
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String addBookPost(@ModelAttribute("User")  User user,  BindingResult result, HttpServletRequest req)
	{
		
service.addUser(user);
		return "welcome";
		//return "redirect:/";
	}

}