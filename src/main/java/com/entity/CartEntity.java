package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CartEntity")
public class CartEntity extends BaseEntity<CartEntity> {

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;

	@OneToMany(mappedBy = "cartEntity")
	private List<CartItemEntity> cartItemEntity = new ArrayList<CartItemEntity>();

	@Column(name = "fullname")
	private String fullName;
	@Column
	private int status;

	@Column
	private String mobile;

	@Column
	private String email;
	@Column
	private String country;
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	public List<CartItemEntity> getCartItemEntity() {
		return cartItemEntity;
	}
	public void setCartItemEntity(List<CartItemEntity> cartItemEntity) {
		this.cartItemEntity = cartItemEntity;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
