package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TransactionEntity")
public class TransactionEntity extends BaseEntity<TransactionEntity> {
	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;
	@ManyToOne
	@JoinColumn(name = "oderid")
	private OderEntity oderEntity;
	@Column
	private String type;

	@Column
	private int status;

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public OderEntity getOderEntity() {
		return oderEntity;
	}

	public void setOderEntity(OderEntity oderEntity) {
		this.oderEntity = oderEntity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
