package com.converter;

import org.springframework.stereotype.Component;

import com.dto.CategoryDTO;
import com.entity.CategoryEntity;

@Component
public class CategoryConverter {
	public CategoryDTO toDTO(CategoryEntity entity) {
		CategoryDTO dto = new CategoryDTO();
		if (entity.getId() != null) {
			dto.setId(entity.getId());
		}
		dto.setCode(entity.getCode());
		dto.setName(entity.getName());
		dto.setUri(entity.getUri());
		return dto;
	}

	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setUri(dto.getCode());
		return entity;
	}

	public CategoryEntity toEntity(CategoryDTO dto, CategoryEntity entity) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setUri(dto.getCode());
		return entity;
	}
}
