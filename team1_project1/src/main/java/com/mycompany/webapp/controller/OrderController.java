package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.MemberDetails;
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
	public String getOrderList(Authentication authentication) {
		logger.info("실행");
		JSONObject json = new JSONObject();
		if (authentication != null) {
			// 로그인한 유저 정보의 넘버로 데이터 얻기
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();
			json.put("result", orderService.getOrderList(mno));
		} else {
			json.put("result", "fail");
		}
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
	public String getOrderDetailList(Authentication authentication, int code) {
		logger.info("실행");
		JSONObject json = new JSONObject();
		if (authentication != null) {
			// 유저 넘버와 그에 맞는 주문번호로 상품주문상세정보 가져오기
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();
			json.put("result", orderService.getOrderDetail(mno, code));
		} else {
			json.put("result", "fail");
		}
		return json.toString();
	}

}
