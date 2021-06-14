package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.converter.UserConverter;
import com.dto.UserDTO;
import com.entity.UserEntity;
import com.entity.UserRoleEntity;
import com.repository.RoleRepository;
import com.repository.UserRepository;
import com.repository.UserRoleRepository;
import com.service.IUserService;

@Service
public class UserService implements IUserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private UserRoleRepository userRoleRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDTO save(UserDTO dto) {
		UserEntity entity = userRepository.save(userConverter.toEntity(dto));
		if (entity.getId() != null) {
			UserRoleEntity userRoleEntity = new UserRoleEntity();
			userRoleEntity.setUserEntity(entity);
			userRoleEntity.setRoleEntity(roleRepository.findOneByName("ADMIN"));
			userRoleRepository.save(userRoleEntity);
		}
		return userConverter.toDTO(entity);
	}

}
