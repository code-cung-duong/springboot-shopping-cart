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
@Table(name = "CategoryEntity")
public class CategoryEntity extends BaseEntity<CategoryEntity> {
	@Column
	private String code;

	@Column
	private String name;

	@OneToMany(mappedBy = "categoryEntity")
	private List<CategoryEntity> categoryEntities = new ArrayList<CategoryEntity>();

	@ManyToOne
	@JoinColumn(name = "parentid")
	private CategoryEntity categoryEntity;

	@OneToMany(mappedBy = "categoryEntity")
	private List<ProductEntity> productEntities = new ArrayList<ProductEntity>();

	public List<CategoryEntity> getCategoryEntities() {
		return categoryEntities;
	}

	public void setCategoryEntities(List<CategoryEntity> categoryEntities) {
		this.categoryEntities = categoryEntities;
	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public List<ProductEntity> getProductEntities() {
		return productEntities;
	}

	public void setProductEntities(List<ProductEntity> productEntities) {
		this.productEntities = productEntities;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
