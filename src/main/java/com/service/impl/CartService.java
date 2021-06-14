package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.constans.System;
import com.converter.CartConverter;
import com.dto.CartDTO;
import com.entity.CartEntity;
import com.repository.CartRepository;
import com.repository.UserRepository;
import com.service.ICartService;

@Service
public class CartService implements ICartService {


	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CartConverter cartConverter;


	@Override
	public void delete(long[] ids) {
		for (long i : ids) {
			cartRepository.delete(i);
		}
	}


	@Override
	public CartDTO save(CartDTO dto) {
		CartEntity entity = cartRepository.save(cartConverter.toEntity(dto));
		return cartConverter.toDTO(entity);
	}


	@Override
	public CartDTO findByUserIdAndStatus(long userid, int status) {
		CartEntity entity = cartRepository.findOneByUserEntityAndStatus(userRepository.findOne(userid), System.ACTIVE_CART);
		return cartConverter.toDTO(entity);
	}

	

}
