package com.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "UserRoleEntity")
public class UserRoleEntity extends BaseEntity<UserRoleEntity> {

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;

	@ManyToOne
	@JoinColumn(name = "roleid")
	private RoleEntity roleEntity;

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public RoleEntity getRoleEntity() {
		return roleEntity;
	}

	public void setRoleEntity(RoleEntity roleEntity) {
		this.roleEntity = roleEntity;
	}

}
