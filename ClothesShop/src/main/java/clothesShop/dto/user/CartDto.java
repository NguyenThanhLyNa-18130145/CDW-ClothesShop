package clothesShop.dto.user;

import clothesShop.entity.Product;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDto {
	private String color;
	private String size;
	private int quantity;
	private double totalPrice;
	private Product product;

	public CartDto() {

	}

	public CartDto(String color, String size, int quantity, double totalPrice, Product product) {
		super();
		this.color = color;
		this.size = size;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.product = product;
	}

}
