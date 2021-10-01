package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Resource
	private CartService cartService;
	
	@RequestMapping("/content")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping("/order")
	public String order() {
		return "order";
	}
	
	
	@GetMapping(value =  "/getlist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getList() {
		JSONObject json = new JSONObject();
		
		json.append("infoList", cartService.getCartDetailList(0));
		return json.toString();
	}
}
