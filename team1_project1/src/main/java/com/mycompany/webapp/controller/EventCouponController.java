package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventCouponController {

	@RequestMapping("/event")
	public String event() {
		return "event";
	}
}
