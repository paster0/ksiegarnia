package pl.ksiegarnia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.ksiegarnia.service.UserAdminService;


@Controller
@RequestMapping(value = "/admin")
public class UserAdminController 

{
	
	@Autowired
	UserAdminService service;
	

	

}
