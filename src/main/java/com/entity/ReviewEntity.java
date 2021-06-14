package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ReviewEntity")
public class ReviewEntity extends BaseEntity<ReviewEntity> {
	@Column
	private int rate;
	@Column
	private String content;

	@ManyToOne
	@JoinColumn(name = "productid")
	private ProductEntity productEntity;

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

}
