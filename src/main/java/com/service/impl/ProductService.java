package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.converter.ConverterToURL;
import com.converter.ProductConverter;
import com.dto.ProductDTO;
import com.entity.CartItemEntity;
import com.entity.ProductEntity;
import com.repository.CartItemRepository;
import com.repository.CategoryRepository;
import com.repository.ProductRepository;
import com.service.IProductService;

@Service
public class ProductService implements IProductService {
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductConverter productConverter;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CartItemRepository cartItemRepository;
	@Override
	public List<ProductDTO> findAllBrand() {
		List<ProductEntity> entities = productRepository.findAllBrand();
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		for (ProductEntity a : entities) {
			ProductDTO b = productConverter.toDTO(a);
			b.setTotalBrand(productRepository.countByBrand(b.getBrand()));
			dtos.add(b);
		}
		return dtos;
	}

	@Override
	public List<ProductDTO> findAllColor() {
		List<ProductEntity> entities = productRepository.findAllColor();
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		for (ProductEntity a : entities) {
			ProductDTO s = productConverter.toDTO(a);
			s.setTotalColor(productRepository.countByColor(s.getColor()));
			dtos.add(s);

		}
		return dtos;
	}

	@Override
	public List<ProductDTO> findAll() {
		List<ProductEntity> entities = (List<ProductEntity>) productRepository.findAll();
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		for (int i = 0; i < entities.size(); i++) {
			dtos.add(productConverter.toDTO(entities.get(i)));
		}
		return dtos;
	}

	@Override
	public ProductDTO findOne(long id) {
		ProductDTO dto = productConverter.toDTO(productRepository.findOne(id));
		return dto;
	}

	@Override
	public int total() {
		return (int) productRepository.count();
	}

	@Override
	public ProductDTO save(ProductDTO dto) {
		ProductEntity entity = new ProductEntity();
		dto.setUri(ConverterToURL.toUrl(dto.getName()));
		if (dto.getId() != null) {
			ProductEntity old = productRepository.findOne(dto.getId());
			entity = productConverter.toEntity(dto, old);
		} else {
			entity = productConverter.toEntity(dto);

		}
		entity = productRepository.save(entity);
		return productConverter.toDTO(entity);
	}

	@Override
	public void delete(long[] ids) {
		for (long a : ids) {
			List<CartItemEntity> entities = cartItemRepository.findByProductEntity(productRepository.findOne(a));
			cartItemRepository.delete(entities);
			productRepository.delete(a);
		}

	}

	@Override
	public List<ProductDTO> findByCategoryCode(String code) {
		List<ProductEntity> entities = productRepository.findByCategoryEntity(categoryRepository.findOneByCode(code));
		List<ProductDTO> dto = new ArrayList<ProductDTO>();
		for (ProductEntity a : entities) {
			dto.add(productConverter.toDTO(a));
		}
		return dto;
	}

	@Override
	public ProductDTO findOneByUri(String uri) {
		return productConverter.toDTO(productRepository.findOneByUri(uri));
	}

	@Override
	public List<ProductDTO> search(String key) {
		List<ProductEntity> entities = productRepository.searchAll(key);
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		for (ProductEntity e : entities) {
			dtos.add(productConverter.toDTO(e));
		}
		return dtos;
	}

}
