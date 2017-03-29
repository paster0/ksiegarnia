package pl.ksiegarnia.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pl.ksiegarnia.model.Book;
import pl.ksiegarnia.service.ProductUserService;

@RestController
@RequestMapping("/rest/product")
public class RestProductController {

	@Autowired
	ProductUserService service;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Book>> allProducts() {
        List<Book> allProducts = service.getAll();
        return ResponseEntity.ok(allProducts);
    }
	
	
	
	
}
