package com.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dto.CartItemDTO;
import com.entity.CartItemEntity;
import com.repository.ProductRepository;

@Component
public class CartItemConverter {

	@Autowired
	private ProductRepository productRepository;

	public CartItemDTO toDTO(CartItemEntity entity) {
		CartItemDTO dto = new CartItemDTO();
		if (entity.getId() != null) {
			dto.setId(entity.getId());
		}
		dto.setProductId(entity.getProductEntity().getId());
		dto.setPrice(entity.getProductEntity().getPrice());
		dto.setQuanlity(entity.getQuanlity());
		dto.setImage(entity.getProductEntity().getImage());
		dto.setName(entity.getProductEntity().getName());
		return dto;
	}
	
	public CartItemEntity toEntity(CartItemDTO dto) {
		CartItemEntity entity = new CartItemEntity();
		entity.setQuanlity(dto.getQuanlity());
		entity.setProductEntity(productRepository.findOne(dto.getProductId()));
		return entity;
	}
	
	public CartItemEntity toEntity(CartItemDTO dto, CartItemEntity entity) {
		entity.setQuanlity(dto.getQuanlity());
		entity.setProductEntity(productRepository.findOne(dto.getProductId()));
		return entity;
	}
	
	
}
