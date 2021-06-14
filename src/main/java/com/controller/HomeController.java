package com.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.CartItemDTO;
import com.dto.ProductDTO;
import com.service.impl.CartItemService;
import com.service.impl.ProductService;
import com.util.SecurityUtils;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private JavaMailSender javaMailSender;

	@RequestMapping(value = "/shop")
	public String shop(Model model) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setListResult(productService.findAll());
		model.addAttribute("products", productDTO);
		try {
			model.addAttribute("user", SecurityUtils.getPrincipal());
		} catch (Exception e) {
		}

		return "shop";
	}

	@RequestMapping(value = "/{code}")
	public String shop(Model model, @PathVariable String code) {
		ProductDTO productDTO = new ProductDTO();
		try {
			productDTO = productService.findOneByUri(code);
		} catch (Exception e) {
		}

		if (productDTO.getId() != null) {
			model.addAttribute("products", productDTO);
			return "single-product";
		} else {
			if (code.equalsIgnoreCase("shop") == false) {
				productDTO.setListResult(productService.findByCategoryCode(code));
				productDTO.setUri(code);
			} else {
				productDTO.setListResult(productService.findAll());
			}
			model.addAttribute("products", productDTO);
			return "shop";
		}

	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/login")
	public String login() {
		try {
			String user = SecurityUtils.getPrincipal().getFullName();
			return "redirect:/home";
		} catch (Exception e) {
			return "login";
		}

	}

	@RequestMapping(value = "/")
	public String redirect() {
		return "redirect:home";
	}

	@RequestMapping(value = "/send")
	public String send() throws MessagingException {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper help = new MimeMessageHelper(message, true, "utf-8");
		String html = "<html>\r\n" + 
				"    <a href=\"http://localhost:8099/send\">Go</a>\r\n" + 
				"</html>";
		message.setContent(html, "text/html");
		help.setTo("longduong251120@gmail.com");
		help.setSubject("Test");
		this.javaMailSender.send(message);
		return null;
	}

	@RequestMapping(value = "/home")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/single-product")
	public String singleProduct() {
		return "single-product";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/checkout")
	public String checkout(Model model) {
		CartItemDTO cartItemDTO = new CartItemDTO();
		cartItemDTO.setListResult(cartItemService.findByUserId(SecurityUtils.getPrincipal().getId()));
		model.addAttribute("carts", cartItemDTO);
		return "checkout";
	}

	@RequestMapping(value = "/cart")
	public String cart(Model model) {
		return "cart";
	}
}
