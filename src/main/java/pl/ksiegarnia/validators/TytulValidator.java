package pl.ksiegarnia.validators;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import pl.ksiegarnia.model.Book;


@Component
public class TytulValidator implements Validator

{

	@Override
	public boolean supports(Class<?> claz) {
		return Book.class.isAssignableFrom(claz);
	}
	@Override
	public void validate(Object target, Errors errors)
	{
Book book = (Book)target;		
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tytul" ,"NotNull.Book.tytul");
if(book.getCena()<=0)
{
	errors.rejectValue("cena", "tanio");
}
if(book.getIlosc()<=0)
{
	errors.rejectValue("ilosc", "ilosc");
}
if(book.getImieautora()==null||book.getImieautora().equals(""))
{
	errors.rejectValue("imieautora", "pusto");
}
if(book.getNazwiskoautora()==null||book.getNazwiskoautora().equals(""))
{
	errors.rejectValue("nazwiskoautora", "pusto");
}


	}

}
