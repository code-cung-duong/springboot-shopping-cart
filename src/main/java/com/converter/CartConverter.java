package com.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dto.CartDTO;
import com.entity.CartEntity;
import com.repository.UserRepository;

@Component
public class CartConverter {

	@Autowired
	private UserRepository userRepository;
	public CartDTO toDTO(CartEntity entity) {
		CartDTO dto = new CartDTO();
		if (entity.getId() != null) {
			dto.setId(entity.getId());
		}
		dto.setCountry(entity.getCountry());
		dto.setEmail(entity.getEmail());
		dto.setFullName(entity.getFullName());
		dto.setMobile(entity.getMobile());
		dto.setStatus(entity.getStatus());
		return dto;
	}

	public CartEntity toEntity(CartDTO dto, CartEntity entity) {
		return entity;
	}

	public CartEntity toEntity(CartDTO dto) {
		CartEntity entity = new CartEntity();
		entity.setCountry(dto.getCountry());
		entity.setEmail(dto.getEmail());
		entity.setFullName(dto.getFullName());
		entity.setMobile(dto.getMobile());
		entity.setStatus(dto.getStatus());
		entity.setUserEntity(userRepository.findOne(dto.getUserId()));
		return entity;
	}
}
