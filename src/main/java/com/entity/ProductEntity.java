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
@Table(name = "ProductEntity")
public class ProductEntity extends BaseEntity<ProductEntity> {
	@Column
	private String name;
	@Column
	private float price;
	@Column
	private String brand;
	@Column
	private String color;
	@Column
	private String image;
	@Column
	private long quanlity;
	@Column
	private int favorite;
	@Column
	private int sold;
	@Column(name = "shortdecription", columnDefinition = "TEXT")
	private String shortDecription;
	@Column(columnDefinition = "TEXT")
	private String decription;
	@Column
	private String size;
	@Column(name = "pricesale")
	private float priceSale;

	@OneToMany(mappedBy = "productEntity")
	private List<CommentEntity> commentEntities = new ArrayList<CommentEntity>();

	@ManyToOne
	@JoinColumn(name = "categoryid")
	private CategoryEntity categoryEntity;

	@OneToMany(mappedBy = "productEntity")
	private List<ReviewEntity> reviewEntities = new ArrayList<ReviewEntity>();

	@OneToMany(mappedBy = "productEntity")
	private List<TagProductEntity> tagProductEntities = new ArrayList<TagProductEntity>();

	@OneToMany(mappedBy = "productEntity")
	private List<CartItemEntity> cartItemEntities = new ArrayList<CartItemEntity>();

	@OneToMany(mappedBy = "productEntity")
	private List<OderItemEntity> oderItemEntities = new ArrayList<OderItemEntity>();

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public long getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(long quanlity) {
		this.quanlity = quanlity;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getShortDecription() {
		return shortDecription;
	}

	public void setShortDecription(String shortDecription) {
		this.shortDecription = shortDecription;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public float getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(float priceSale) {
		this.priceSale = priceSale;
	}

	public List<CommentEntity> getCommentEntities() {
		return commentEntities;
	}

	public void setCommentEntities(List<CommentEntity> commentEntities) {
		this.commentEntities = commentEntities;
	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public List<ReviewEntity> getReviewEntities() {
		return reviewEntities;
	}

	public void setReviewEntities(List<ReviewEntity> reviewEntities) {
		this.reviewEntities = reviewEntities;
	}

	public List<TagProductEntity> getTagProductEntities() {
		return tagProductEntities;
	}

	public void setTagProductEntities(List<TagProductEntity> tagProductEntities) {
		this.tagProductEntities = tagProductEntities;
	}

	public List<CartItemEntity> getCartItemEntities() {
		return cartItemEntities;
	}

	public void setCartItemEntities(List<CartItemEntity> cartItemEntities) {
		this.cartItemEntities = cartItemEntities;
	}

	public List<OderItemEntity> getOderItemEntities() {
		return oderItemEntities;
	}

	public void setOderItemEntities(List<OderItemEntity> oderItemEntities) {
		this.oderItemEntities = oderItemEntities;
	}

}
