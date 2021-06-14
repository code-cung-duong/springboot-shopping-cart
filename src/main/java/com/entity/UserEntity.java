package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "UserEntity")
public class UserEntity extends BaseEntity<UserEntity> {

	@Column(name = "username", unique = true)
	private String userName;
	@Column
	private String password;
	@Column(name = "fullname")
	private String fullName;
	@Column
	private String email;

	@Column
	private String address;

	@Column
	private String avatar;

	@Column
	private int status;

	@OneToMany(mappedBy = "userEntity")
	private List<UserRoleEntity> userRoleEntity = new ArrayList<UserRoleEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<CommentEntity> commentEntity = new ArrayList<CommentEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<CartEntity> cartEntities = new ArrayList<CartEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<ReviewEntity> reviewEntities = new ArrayList<ReviewEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<OderEntity> oderEntities = new ArrayList<OderEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<TransactionEntity> transactionEntities = new ArrayList<TransactionEntity>();

	public UserEntity(UserEntity userEntity) {
		// TODO Auto-generated constructor stub
	}

	public UserEntity() {
		// TODO Auto-generated constructor stub
	}

	public List<UserRoleEntity> getUserRoleEntity() {
		return userRoleEntity;
	}

	public void setUserRoleEntity(List<UserRoleEntity> userRoleEntity) {
		this.userRoleEntity = userRoleEntity;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<CommentEntity> getCommentEntity() {
		return commentEntity;
	}

	public void setCommentEntity(List<CommentEntity> commentEntity) {
		this.commentEntity = commentEntity;
	}

	public List<ReviewEntity> getReviewEntities() {
		return reviewEntities;
	}

	public void setReviewEntities(List<ReviewEntity> reviewEntities) {
		this.reviewEntities = reviewEntities;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
