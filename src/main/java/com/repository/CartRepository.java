package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.CartEntity;
import com.entity.UserEntity;

@Repository
public interface CartRepository extends JpaRepository<CartEntity, Long> {
	CartEntity findOneByUserEntityAndStatus(UserEntity entity, int status);

}
