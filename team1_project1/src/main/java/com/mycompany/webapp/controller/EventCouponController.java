package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventCouponController {
	private static final Logger logger = LoggerFactory.getLogger(EventCouponController.class);

	// 이벤트쿠폰페이지
	@RequestMapping("/event")
	public String event() {
		return "event";
	}
}
