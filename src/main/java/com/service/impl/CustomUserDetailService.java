package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.constans.System;
import com.dto.MyUser;
import com.entity.RoleEntity;
import com.entity.UserEntity;
import com.entity.UserRoleEntity;
import com.repository.UserRepository;
import com.repository.UserRoleRepository;

@Service
public class CustomUserDetailService implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CartItemService cartItemServicel;

	@Autowired
	private UserRoleRepository userRoleRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findByUserNameAndStatus(username, System.ACTIVE_USER);
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		List<UserRoleEntity> userRoleEntities = userRoleRepository.findByUserEntity(userEntity);
		List<RoleEntity> roleEntities = new ArrayList<RoleEntity>();
		for (UserRoleEntity o : userRoleEntities) {
			roleEntities.add(o.getRoleEntity());
		}
		for (RoleEntity a : roleEntities) {
			authorities.add(new SimpleGrantedAuthority(a.getRole()));
		}

		MyUser user = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true,
				authorities);
		user.setFullName(userEntity.getFullName());
		user.setId(userEntity.getId());
		user.setCountProductByCart(cartItemServicel.countByUserId(user.getId()));
		return user;
	}

}
