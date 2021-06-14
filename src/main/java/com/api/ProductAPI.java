package com.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dto.ProductDTO;
import com.service.impl.ProductService;

@RestController
public class ProductAPI {

	@Autowired
	private ProductService productService;

	@PostMapping(value = "/api/product")
	public ProductDTO save(@RequestBody ProductDTO dto) {
		return productService.save(dto);
	}

	@PutMapping(value = "/api/product")
	public ProductDTO update(@RequestBody ProductDTO dto) {
		return productService.save(dto);

	}

	@DeleteMapping(value = "/api/product")
	public void delete(@RequestBody long[] ids) {
		productService.delete(ids);
	}

}
