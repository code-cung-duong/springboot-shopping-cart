package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OderItemEntity")
public class OderItemEntity extends BaseEntity<OderItemEntity> {
	@ManyToOne
	@JoinColumn(name = "productid")
	private ProductEntity productEntity;
	@ManyToOne
	@JoinColumn(name = "oderid")
	private OderEntity oderEntity;

	@Column
	private float price;

	@Column
	private int quanlity;

	@Column
	private float discount;

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public OderEntity getOderEntity() {
		return oderEntity;
	}

	public void setOderEntity(OderEntity oderEntity) {
		this.oderEntity = oderEntity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
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

}
