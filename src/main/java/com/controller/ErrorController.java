package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.autoconfigure.web.ErrorController {

	@RequestMapping("/error_page")
	public String handleError() {
		return "error_page";
	}

	@RequestMapping("/error_access")
	public String permission() {
		return "error_access";
	}

	@Override
	public String getErrorPath() {

		return null;
	}

}
