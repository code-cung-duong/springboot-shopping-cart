package com.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dto.UserDTO;
import com.service.impl.UserService;

@RestController
public class UserAPI {

	@Autowired
	private UserService userService;

	@PostMapping(value = "/api/user")
	public UserDTO save(@RequestBody UserDTO dto) {
		return userService.save(dto);
	}
}
