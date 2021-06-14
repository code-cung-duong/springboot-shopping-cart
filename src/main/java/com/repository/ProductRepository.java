package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.CategoryEntity;
import com.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
	int countByCategoryEntity(CategoryEntity categoryEntity);

	@Query("select e from ProductEntity e group by e.color")
	List<ProductEntity> findAllColor();

	int countByColor(String color);

	@Query("select e from ProductEntity e group by e.brand")
	List<ProductEntity> findAllBrand();

	int countByBrand(String brand);

	void deleteByCategoryEntity(CategoryEntity entity);

	List<ProductEntity> findByCategoryEntity(CategoryEntity entity);

	ProductEntity findOneByUri(String uri);

	@Query("select e from ProductEntity e where e.name like %:key% or e.brand like %:key% or e.color like %:key%")
	List<ProductEntity> searchAll(@Param("key") String keyword);
}
