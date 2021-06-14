package com.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.entity.CartEntity;
import com.entity.CartItemEntity;
import com.entity.ProductEntity;

@Repository
public interface CartItemRepository extends CrudRepository<CartItemEntity, Long> {
	List<CartItemEntity> findByCartEntity(CartEntity cartEntity);
	CartItemEntity findOneByCartEntityAndProductEntity(CartEntity cartEntity, ProductEntity productEntity);
	int countByCartEntity(CartEntity cartEntity);
	List<CartItemEntity> findByProductEntity(ProductEntity entity);
}
