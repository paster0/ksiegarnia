package pl.ksiegarnia.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import pl.ksiegarnia.model.User;
import pl.ksiegarnia.service.UserAdminService;

@Component
public class UserValidator implements Validator

{
	@Autowired
	UserAdminService service;

	@Override
	public boolean supports(Class<?> claz) {
		return User.class.isAssignableFrom(claz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if (!(user.getHaslo().equals(user.getRetypeHaslo()))) {
			errors.rejectValue("retypeHaslo", "retypeHaslo");
		}
		for (User u : service.GetuserList()) {
			if (u.getEmail().equals(user.getEmail())) {
				errors.rejectValue("email", "email");

			}
		}

	}

}
