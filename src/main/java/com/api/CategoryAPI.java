package com.api;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dto.CategoryDTO;
import com.service.impl.CategoryService;

@RestController(value = "CategoryAPI")
public class CategoryAPI {
	@Autowired
	private CategoryService categoryService;

	@PostMapping(value = "/api/category")
	public CategoryDTO save(@RequestBody CategoryDTO dto) {
		return categoryService.save(dto);

	}

	@PutMapping(value = "/api/category")
	public CategoryDTO save(@RequestBody CategoryDTO dto, @PathParam(value = "id") Long id) {
		return categoryService.save(dto);

	}

	@DeleteMapping(value = "/api/category")
	public void delete(@RequestBody long[] ids) {
		categoryService.delete(ids);
	}
}
