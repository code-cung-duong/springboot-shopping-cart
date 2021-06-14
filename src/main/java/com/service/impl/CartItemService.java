package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.constans.System;
import com.converter.CartItemConverter;
import com.dto.CartItemDTO;
import com.entity.CartEntity;
import com.entity.CartItemEntity;
import com.entity.UserEntity;
import com.repository.CartItemRepository;
import com.repository.CartRepository;
import com.repository.ProductRepository;
import com.repository.UserRepository;
import com.service.ICartItemService;
import com.util.SecurityUtils;

@Service
public class CartItemService implements ICartItemService {

	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CartItemConverter cartItemConverter;
	@Autowired
	private CartItemRepository cartItemRepository;
	@Autowired
	private ProductRepository productRepository;

	@Override
	public CartItemDTO save(CartItemDTO dto) {
		long userid = SecurityUtils.getPrincipal().getId();
		CartEntity cartEntity = cartRepository.findOneByUserEntityAndStatus(userRepository.findOne(userid),
				System.ACTIVE_CART);

		if (cartEntity == null) {
			cartEntity = new CartEntity();
			UserEntity userEntity = userRepository.findOne(userid);
			cartEntity.setUserEntity(userEntity);
			cartEntity.setStatus(System.ACTIVE_CART);
			cartEntity = cartRepository.save(cartEntity);
		}

		CartItemEntity cartItemEntity = new CartItemEntity();
		if (dto.getId() != null) {
			CartItemEntity old = cartItemRepository.findOne(dto.getId());
			cartItemEntity = cartItemConverter.toEntity(dto, old);
			cartItemEntity.setCartEntity(cartEntity);

		} else {
			if(cartItemRepository.findOneByCartEntityAndProductEntity(cartEntity,
				productRepository.findOne(dto.getProductId()))==null) {
				cartItemEntity = cartItemConverter.toEntity(dto);
			cartItemEntity.setCartEntity(cartEntity);
			}
			else {
				return null;
			}
			

		}
		cartItemEntity = cartItemRepository.save(cartItemEntity);
		return cartItemConverter.toDTO(cartItemEntity);

	}

	@Override
	public List<CartItemDTO> findByUserId(long id) {
		List<CartItemEntity> entities = cartItemRepository.findByCartEntity(
				cartRepository.findOneByUserEntityAndStatus(userRepository.findOne(id), System.ACTIVE_CART));
		List<CartItemDTO> dto = new ArrayList<CartItemDTO>();
		for (CartItemEntity a : entities) {
			dto.add(cartItemConverter.toDTO(a));
		}
		return dto;
	}

	@Override
	public int countByUserId(long id) {
		return cartItemRepository.countByCartEntity(
				cartRepository.findOneByUserEntityAndStatus(userRepository.findOne(id), System.ACTIVE_CART));
	}

	@Override
	public void delete(long[] ids) {
		for (long a : ids) {
			cartItemRepository.delete(a);
		}

	}

}
