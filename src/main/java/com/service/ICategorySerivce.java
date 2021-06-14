package com.service;

import java.util.List;

import com.dto.CategoryDTO;

public interface ICategorySerivce {
	List<CategoryDTO> findAll();

	CategoryDTO findOne(long id);

	CategoryDTO save(CategoryDTO dto);

	void delete(long[] ids);

	List<CategoryDTO> search(String key);
}
