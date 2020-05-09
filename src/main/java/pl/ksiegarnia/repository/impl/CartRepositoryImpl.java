package pl.ksiegarnia.repository.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pl.ksiegarnia.model.Cart;
import pl.ksiegarnia.repository.CartRepository;

@Repository
public class CartRepositoryImpl implements CartRepository {
	private Map<String, Cart> listOfCarts;

	public CartRepositoryImpl() {
		listOfCarts = new HashMap<String, Cart>();
	}

	@Override
	public Cart create(Cart cart) {
		if (listOfCarts.keySet().contains(cart.getCartId())) {
			throw new IllegalArgumentException(
					String.format("Nie można utworzyć koszyka." + " Koszyk o wskazanym id" + " (%) już istnieje.",
							cart.getCartId()));
		}
		listOfCarts.put(cart.getCartId(), cart);
		return cart;
	}

	@Override
	public Cart read(String cartId) {
		return listOfCarts.get(cartId);
	}

	@Override
	public void update(String cartId, Cart cart) {
		if (!listOfCarts.keySet().contains(cartId)) {
			throw new IllegalArgumentException(String
					.format("Nie można zaktualizować koszyka. Koszyk o wskazanym id (%) nie istnieje.", cartId));
		}
		listOfCarts.put(cartId, cart);

	}

	@Override
	public void delete(String cartId) {
		if (!listOfCarts.keySet().contains(cartId)) {
			throw new IllegalArgumentException(
					String.format("Nie można usunąć koszyka. Koszyk o wskazanym id (%) nie istnieje.", cartId));
		}
		listOfCarts.remove(cartId);

	}

}
