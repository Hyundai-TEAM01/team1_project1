package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderService.OrderResult;

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
	public String newOrder(ProductOrder order, String plist, Model model) {
		int mno = 1;
		int mpoint = 500;
		order.setMno(mno);
		OrderResult result = orderService.newOrder(order,plist, mpoint);

		if(result.equals(OrderResult.SUCCESS)) {
			return "redirect:/orderdetail?code="+order.getPorderno();
		}else if (result.equals(OrderResult.ENOUGH_MPOINT)) {
			model.addAttribute("errorTitle", "사용 가능한 마일리지가 부족합니다.");
			model.addAttribute("errorContent", "정상적인 방식으로 마일리지를 적용해주세요.");
			return "error/custom";
		}else if(result.equals(OrderResult.NOT_VALID)) {
			model.addAttribute("errorTitle", "잘못된 상품 결제입니다.");
			model.addAttribute("errorContent", "정상적인 방식으로 결제를 진행해주세요.");
			return "error/custom";
		}else {
			model.addAttribute("errorTitle", "알 수 없는 서버 오류입니다.");
			model.addAttribute("errorContent", "잠시후 다시 실행해주세요.");
			return "error/custom";
		}

	}
	

}
