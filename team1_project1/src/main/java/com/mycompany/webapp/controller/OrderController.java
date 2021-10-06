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

import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.service.OrderService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource
	OrderService orderService;

	// 주문목록페이지
	@RequestMapping("/orderlist")
	public String orderList() {

		return "orderList";
	}

	// 주문목록페이지 - 목록리스트(JSON)
	@GetMapping(value = "/getorderlist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderList() {
		logger.info(orderService.getOrderList(1).toString());

		JSONObject json = new JSONObject();
		json.append("result", orderService.getOrderList(1));
		logger.info(json.toString());
		
		return json.toString();
	}

	// 주문상세페이지
	@RequestMapping("/orderdetail")
	public String orderDetail() {

		return "orderDetail";
	}

	// 주문상세페이지 - 상세내용(JSON)
	@GetMapping(value = "/getorderdetaillist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderDetailList() {
		logger.info(orderService.getOrderDetail(1, 1).toString());

		JSONObject json = new JSONObject();

		json.append("result", orderService.getOrderDetail(1, 1));
		return json.toString();
	}
	
	@PostMapping(value = "/newOrder", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String newOrder(ProductOrder order) {
		logger.info(order.toString());
		
		int mno = 1;
		order.setMno(mno);
		int result = orderService.newOrder(order);
		
		if(result == 1) {
			// 성공
		}else {
			// 실패 또는 오류
		}
		
		return null;
	}
	

}
