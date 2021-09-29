package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@RequestMapping("/content")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping("/order")
	public String order() {
		return "order";
	}
}
