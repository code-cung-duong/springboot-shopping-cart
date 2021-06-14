package com.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dto.ProductDTO;
import com.entity.ProductEntity;
import com.repository.CategoryRepository;

@Component
public class ProductConverter {
	@Autowired
	private CategoryRepository categoryRepository;

	public ProductDTO toDTO(ProductEntity entity) {
		ProductDTO dto = new ProductDTO();
		if (entity.getId() != null) {
			dto.setId(entity.getId());
		}
		dto.setName(entity.getName());
		dto.setPrice(entity.getPrice());
		dto.setColor(entity.getColor());
		dto.setBrand(entity.getBrand());
		dto.setUri(entity.getUri());
		dto.setDecription(entity.getDecription());
		dto.setShortDecription(entity.getShortDecription());
		dto.setPriceSale(entity.getPriceSale());
		dto.setSize(entity.getSize());
		dto.setFavorite(entity.getFavorite());
		dto.setQuanlity(entity.getQuanlity());
		dto.setSold(entity.getSold());
		dto.setImage(entity.getImage());
		dto.setCategoryId(entity.getCategoryEntity().getId());
		return dto;
	}

	public ProductEntity toEntity(ProductDTO dto) {
		ProductEntity entity = new ProductEntity();
		entity.setName(dto.getName());
		entity.setPrice(dto.getPrice());
		entity.setColor(dto.getColor());
		entity.setBrand(dto.getBrand());
		entity.setUri(dto.getUri());
		entity.setDecription(dto.getDecription());
		entity.setShortDecription(dto.getShortDecription());
		entity.setPriceSale(dto.getPriceSale());
		entity.setSize(dto.getSize());
		entity.setQuanlity(dto.getQuanlity());
		entity.setImage(dto.getImage());
		entity.setCategoryEntity(categoryRepository.findOne(dto.getCategoryId()));
		return entity;
	}

	public ProductEntity toEntity(ProductDTO dto, ProductEntity entity) {
		entity.setName(dto.getName());
		entity.setPrice(dto.getPrice());
		entity.setColor(dto.getColor());
		entity.setBrand(dto.getBrand());
		entity.setUri(dto.getUri());
		entity.setDecription(dto.getDecription());
		entity.setShortDecription(dto.getShortDecription());
		entity.setPriceSale(dto.getPriceSale());
		entity.setSize(dto.getSize());
		entity.setQuanlity(dto.getQuanlity());
		entity.setImage(dto.getImage());
		entity.setCategoryEntity(categoryRepository.findOne(dto.getCategoryId()));
		return entity;
	}
}
