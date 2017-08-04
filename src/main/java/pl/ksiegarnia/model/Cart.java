package pl.ksiegarnia.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;


public class Cart {
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", cartItems=" + cartItems + ", grandTotal=" + grandTotal + "]";
	}
	
	private String uuid = UUID.randomUUID().toString();

	public String getUuid() {
		return uuid;
	}

	@Override
	public int hashCode() {

		return Objects.hash(uuid);
	}

	@Override
	public boolean equals(Object obj) {

		return this == obj || obj instanceof Cart && Objects.equals(uuid, ((Cart) obj).uuid);
	}

	private String cartId;
	private Map<String, CartItem> cartItems;
	private float grandTotal;

	public Cart() {
		cartItems = new HashMap<String, CartItem>();
	}

	public Cart(String cartId) {
		this();
		this.cartId = cartId;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public void updateGrandTotal() 
	{
		grandTotal=0;
		for (CartItem item : cartItems.values()) {
	  //      System.out.println("grandtotal "+ grandTotal+" " + item);
			grandTotal = grandTotal + (item.getTotalPrice());
		}
	}

	public void addCartItem(CartItem item) {
		String productId = String.valueOf(item.getBook().getIdksiazki());
		if (cartItems.containsKey(productId)) {
			CartItem existingCartItem = cartItems.get(productId);
			existingCartItem.setQuantity(existingCartItem.getQuantity() + item.getQuantity());
			existingCartItem.setTotalPrice(existingCartItem.getQuantity()*existingCartItem.getBook().getCena());
			cartItems.put(productId, existingCartItem);
		} else {
			cartItems.put(productId, item);
		}
		updateGrandTotal();
	}

	public void removeCartItem(CartItem item) {
		String productId = String.valueOf(item.getBook().getIdksiazki());
		cartItems.remove(productId);
		updateGrandTotal();
	}

	
}
