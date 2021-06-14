package com.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.dto.CartItemDTO;
import com.dto.CategoryDTO;
import com.dto.MyUser;
import com.dto.ProductDTO;
import com.service.impl.CartItemService;
import com.service.impl.CategoryService;
import com.service.impl.ProductService;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartItemService cartItemService;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/web/**").addResourceLocations("classpath:/web/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/");
		registry.addResourceHandler("/error_page/**").addResourceLocations("classpath:/error_page/");
		registry.addResourceHandler("/error_access/**").addResourceLocations("classpath:/error_access/");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new HandlerInterceptor() {
			@Override
			public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
					throws Exception {
				CategoryDTO categoryDTO = new CategoryDTO();
				categoryDTO.setListResult(categoryService.findAll());
				categoryDTO.setTotalItem(categoryDTO.getListResult().size());
				ProductDTO productDTO = new ProductDTO();
				productDTO.setListBrand(productService.findAllBrand());
				productDTO.setListColor(productService.findAllColor());
				MyUser myUser = null;
				try {
					myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
					request.setAttribute("user", myUser);
				} catch (Exception e) {
					myUser = null;
				}
				CartItemDTO cartItemDTO = new CartItemDTO();
				if (myUser != null) {
					myUser.setCountProductByCart(cartItemService.countByUserId(myUser.getId()));
					cartItemDTO.setListResult(cartItemService.findByUserId(myUser.getId()));
				}
				request.setAttribute("carts", cartItemDTO);
				request.setAttribute("brands", productDTO);
				request.setAttribute("categories", categoryDTO);

				return true;
			}

			@Override
			public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
					ModelAndView modelAndView) throws Exception {

			}

			@Override
			public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
					Exception ex) throws Exception {

			}
		});
	}
}
