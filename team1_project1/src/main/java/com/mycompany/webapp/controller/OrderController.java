package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.service.OrderService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource
	OrderService orderService;

	@RequestMapping("/orderlist")
	public String orderList() {

		return "orderList";
	}

	@GetMapping(value = "/getorderlist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderList() {
		logger.info(orderService.getOrderList(1).toString());

		JSONObject json = new JSONObject();

		json.append("result", orderService.getOrderList(1));
		return json.toString();
	}

	@RequestMapping("/orderdetail")
	public String orderDetail() {

		return "orderDetail";
	}

	@GetMapping(value = "/getorderdetaillist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderDetailList() {
		logger.info(orderService.getOrderDetailList(1, 1).toString());

		JSONObject json = new JSONObject();

		json.append("result", orderService.getOrderDetailList(1, 1));
		return json.toString();
	}
}
