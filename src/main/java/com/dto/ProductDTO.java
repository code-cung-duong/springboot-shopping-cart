package com.dto;

import java.util.ArrayList;
import java.util.List;

public class ProductDTO extends BaseDTO<ProductDTO> {

	private String name;
	private float price;
	private String brand;
	private String color;
	private String image;
	private long quanlity;
	private int favorite;
	private int sold;
	private String shortDecription;
	private String decription;
	private String size;
	private float priceSale;
	private List<ProductDTO> listBrand = new ArrayList<ProductDTO>();
	private int totalBrand;
	private List<ProductDTO> listColor = new ArrayList<ProductDTO>();
	private long categoryId;
	private int totalColor;

	public int getTotalColor() {
		return totalColor;
	}

	public void setTotalColor(int totalColor) {
		this.totalColor = totalColor;
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

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
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

	public List<ProductDTO> getListBrand() {
		return listBrand;
	}

	public void setListBrand(List<ProductDTO> listBrand) {
		this.listBrand = listBrand;
	}

	public int getTotalBrand() {
		return totalBrand;
	}

	public void setTotalBrand(int totalBrand) {
		this.totalBrand = totalBrand;
	}

	public List<ProductDTO> getListColor() {
		return listColor;
	}

	public void setListColor(List<ProductDTO> listColor) {
		this.listColor = listColor;
	}

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

}
