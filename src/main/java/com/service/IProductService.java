package com.service;

import java.util.List;

import com.dto.ProductDTO;

public interface IProductService {
	List<ProductDTO> findAllBrand();

	List<ProductDTO> findAllColor();

	List<ProductDTO> findAll();

	ProductDTO findOne(long id);

	int total();

	ProductDTO save(ProductDTO dto);

	void delete(long[] ids);

	List<ProductDTO> findByCategoryCode(String code);

	ProductDTO findOneByUri(String uri);

	List<ProductDTO> search(String key);
}
