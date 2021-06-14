package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.CategoryEntity;

@Repository
public interface CategoryRepository extends CrudRepository<CategoryEntity, Long> {
	CategoryEntity findOneById(Long id);

	CategoryEntity findOneByCode(String code);

	@Query("select e from CategoryEntity e where e.name like %:name% or e.code like %:name%")
	List<CategoryEntity> searchAll(@Param("name") String keyword);
}
