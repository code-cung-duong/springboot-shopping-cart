package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.converter.CategoryConverter;
import com.dto.CategoryDTO;
import com.entity.CategoryEntity;
import com.repository.CategoryRepository;
import com.repository.ProductRepository;
import com.service.ICategorySerivce;

@Service
public class CategoryService implements ICategorySerivce {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CategoryConverter categoryConverter;
	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryEntity> categoryEntities = (List<CategoryEntity>) categoryRepository.findAll();
		List<CategoryDTO> dto = new ArrayList<CategoryDTO>();
		for (CategoryEntity a : categoryEntities) {
			CategoryDTO d = categoryConverter.toDTO(a);
			d.setTotalItem(productRepository.countByCategoryEntity(categoryRepository.findOneById(a.getId())));
			dto.add(d);
		}
		return dto;
	}

	@Override
	public CategoryDTO findOne(long id) {
		CategoryEntity dtp = categoryRepository.findOne(id);
		return categoryConverter.toDTO(dtp);
	}

	@Override
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
		if (dto.getId() != null) {
			CategoryEntity old = categoryRepository.findOne(dto.getId());
			entity = categoryConverter.toEntity(dto, old);
		} else {
			entity = categoryConverter.toEntity(dto);
		}
		entity = categoryRepository.save(entity);
		return categoryConverter.toDTO(entity);
	}

	@Override
	public void delete(long[] ids) {
		for (long a : ids) {
			productRepository.deleteByCategoryEntity(categoryRepository.findOne(a));
			categoryRepository.delete(a);
		}
	}

	@Override
	public List<CategoryDTO> search(String key) {
		List<CategoryEntity> entities = categoryRepository.searchAll(key);
		List<CategoryDTO> dtos = new ArrayList<CategoryDTO>();
		for (CategoryEntity a : entities) {
			dtos.add(categoryConverter.toDTO(a));

		}
		return dtos;
	}

}
