package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/orderlist")
	public String orderList() {
		return "orderList";
	}

	@RequestMapping("/orderdetail")
	public String orderDetail() {
		return "orderDetail";
	}
}
