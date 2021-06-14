package com.converter;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.dto.UserDTO;
import com.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDTO(UserEntity entity) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		UserDTO dto = new UserDTO();
		if (entity.getId() != null) {
			dto.setId(entity.getId());
		}
		dto.setFullName(entity.getFullName());
		dto.setPassword(bCryptPasswordEncoder.encode(entity.getPassword()));
		dto.setUserName(entity.getUserName());
		return dto;
	}

	public UserEntity toEntity(UserDTO dto) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		UserEntity entity = new UserEntity();
		entity.setFullName(dto.getFullName());
		entity.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
		entity.setUserName(dto.getUserName());
		entity.setStatus(1);
		return entity;
	}
}
