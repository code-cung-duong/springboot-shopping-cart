package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CartItemEntity")
public class CartItemEntity extends BaseEntity<CartItemEntity> {
	@ManyToOne
	@JoinColumn(name = "productid")
	private ProductEntity productEntity;
	@ManyToOne
	@JoinColumn(name = "cartid")
	private CartEntity cartEntity;

	@Column
	private int quanlity;

	@Column
	private float price;
	@Column
	private float discount;

	@Column
	private int active;

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public CartEntity getCartEntity() {
		return cartEntity;
	}

	public void setCartEntity(CartEntity cartEntity) {
		this.cartEntity = cartEntity;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
