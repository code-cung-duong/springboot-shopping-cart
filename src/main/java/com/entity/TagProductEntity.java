package com.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TagProductEntity")
public class TagProductEntity extends BaseEntity<TagProductEntity> {
	@ManyToOne
	@JoinColumn(name = "tagid")
	private TagEntity tagEntity;

	@ManyToOne
	@JoinColumn(name = "productid")
	private ProductEntity productEntity;

	public TagEntity getTagEntity() {
		return tagEntity;
	}

	public void setTagEntity(TagEntity tagEntity) {
		this.tagEntity = tagEntity;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

}
