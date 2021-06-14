package com.service;

import com.dto.CartDTO;

public interface ICartService {
	CartDTO save(CartDTO dto);
	void delete(long[] ids);
	CartDTO findByUserIdAndStatus(long userid, int status);
}
