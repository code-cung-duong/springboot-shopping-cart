package com.service;

import java.util.List;

import com.dto.CartItemDTO;

public interface ICartItemService {
	CartItemDTO save(CartItemDTO dto);
	List<CartItemDTO> findByUserId(long id);	
	int countByUserId(long id);
	void delete(long[] ids);
}
