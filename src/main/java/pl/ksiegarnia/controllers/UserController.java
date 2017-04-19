package pl.ksiegarnia.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	@InitBinder
	public void dataBinding(WebDataBinder binder) {
		binder.addValidators(validator);
	
	} 
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/login")
	public ModelAndView loggin(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("welcome");
		String mail = req.getParameter("mail");
		String haslo = req.getParameter("haslo");
		User user = service.loggin(mail, haslo);
		if(user!=null)
		{
	//	System.out.println(user.toString());
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		}
		else
		{
			mav.addObject("blad", "blad");
		}
		return mav;
	}
	
	@RequestMapping("/reg")
	public ModelAndView reg(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView("register");
		modelAndView.addObject("User", new User());	
		return modelAndView;
	}
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String addBookPost(@ModelAttribute("User") @Valid  User user,  BindingResult result, HttpServletRequest req)
	{
		 if(result.hasErrors()) {
		    	return "register";
		    }
		
        service.addWithDefaultRole(user);
		return "welcome";
		//return "redirect:/";
	}

}