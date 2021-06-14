package com.util;

import org.springframework.security.core.context.SecurityContextHolder;

import com.dto.MyUser;

public class SecurityUtils {
	public static MyUser getPrincipal() {
		MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		return myUser;
	}
}
