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
@Table(name = "CommentEntity")
public class CommentEntity extends BaseEntity<CommentEntity> {
	@Column
	private String content;

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity userEntity;

	@ManyToOne
	@JoinColumn(name = "productid")
	private ProductEntity productEntity;

	@OneToMany(mappedBy = "commentEntity")
	private List<CommentEntity> commentEntities = new ArrayList<CommentEntity>();

	@ManyToOne
	@JoinColumn(name = "parentid")
	private CommentEntity commentEntity;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public List<CommentEntity> getCommentEntities() {
		return commentEntities;
	}

	public void setCommentEntities(List<CommentEntity> commentEntities) {
		this.commentEntities = commentEntities;
	}

	public CommentEntity getCommentEntity() {
		return commentEntity;
	}

	public void setCommentEntity(CommentEntity commentEntity) {
		this.commentEntity = commentEntity;
	}

}
