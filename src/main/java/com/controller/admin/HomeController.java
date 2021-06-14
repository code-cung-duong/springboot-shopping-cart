package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.CategoryDTO;
import com.dto.ProductDTO;
import com.service.impl.CategoryService;
import com.service.impl.ProductService;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/admin/home")
	public String adminHome(Model model) {
		String ac = "ac";
		model.addAttribute("home_ac", ac);
		return "admin/home";
	}

	@RequestMapping(value = "/admin/category")
	public String category(Model model, @RequestParam(name = "keyword", required = false) String keyword) {
		if (keyword != null) {
			CategoryDTO dto = new CategoryDTO();
			List<CategoryDTO> li = categoryService.search(keyword);
			dto.setListResult(li);
			dto.setTotalItem(li.size());
			model.addAttribute("categories", dto);
		}

		String ac = "ac";
		model.addAttribute("category_ac", ac);
		return "admin/category";
	}

	@RequestMapping(value = "/admin/edit_product")
	public String editProduct(Model model, @RequestParam(name = "id", required = false) Long id) {
		if (id != null) {
			ProductDTO dto = productService.findOne(id);
			model.addAttribute("products", dto);
		}
		String ac = "ac";
		model.addAttribute("product_ac", ac);

		return "admin/edit-product";
	}

	@RequestMapping(value = "/admin/edit_category")
	public String editCategory(Model model, @RequestParam(name = "id", required = false) Long id) {
		if (id != null) {
			CategoryDTO ca = categoryService.findOne(id);
			model.addAttribute("category", ca);
		}
		String ac = "ac";
		model.addAttribute("category_ac", ac);

		return "admin/edit-category";
	}

	@RequestMapping(value = "/admin/product")
	public String products(Model model, @RequestParam(name = "keyword", required = false) String key) {
		ProductDTO dtos = new ProductDTO();
		if (key != null) {
			dtos.setListResult(productService.search(key));
			dtos.setTotalItem(dtos.getListResult().size());
		} else {
			dtos.setListResult(productService.findAll());
			dtos.setTotalItem(productService.total());
		}
		String ac = "ac";
		model.addAttribute("product_ac", ac);
		model.addAttribute("products", dtos);
		return "admin/product";
	}
}
