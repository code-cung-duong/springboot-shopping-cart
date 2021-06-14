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
@Table(name = "OderEntity")
public class OderEntity extends BaseEntity<OderEntity> {

	@Column(name = "shipprice")
	private long shipPrice;

	@Column(name = "totalprice")
	private long totalPrice;

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;

	@OneToMany(mappedBy = "oderEntity")
	private List<OderItemEntity> oderItemEntity = new ArrayList<OderItemEntity>();

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

	@Column
	private float discount;
	@Column(name = "subtotal")
	private int subTotal;

	@OneToMany(mappedBy = "oderEntity")
	private List<TransactionEntity> transactionEntities = new ArrayList<TransactionEntity>();

	public long getShipPrice() {
		return shipPrice;
	}

	public void setShipPrice(long shipPrice) {
		this.shipPrice = shipPrice;
	}

	public long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public List<OderItemEntity> getOderItemEntity() {
		return oderItemEntity;
	}

	public void setOderItemEntity(List<OderItemEntity> oderItemEntity) {
		this.oderItemEntity = oderItemEntity;
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

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}

	public List<TransactionEntity> getTransactionEntities() {
		return transactionEntities;
	}

	public void setTransactionEntities(List<TransactionEntity> transactionEntities) {
		this.transactionEntities = transactionEntities;
	}

}
