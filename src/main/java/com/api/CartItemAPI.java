package com.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dto.CartItemDTO;
import com.service.impl.CartItemService;

@RestController(value = "CartItemAPI")
public class CartItemAPI {
	
	@Autowired
	private CartItemService cartItemService;
	@PostMapping(value = "/api/cartitem")
	public CartItemDTO save(@RequestBody CartItemDTO dto) {
		return cartItemService.save(dto);
	}
	
	@DeleteMapping(value = "/api/cartitem")
	public void delete(@RequestBody long[] ids) {
		cartItemService.delete(ids);
	}
}
