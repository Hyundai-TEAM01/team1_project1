package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.dto.Pager;
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

	// 주문목록페이지 - 목록리스트 페이징 적용(JSON)(진행중)
	@GetMapping(value = "/getorderlistbypage", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderListByPage(Authentication authentication,
			@RequestParam(name = "pageNo", defaultValue = "1") int pageNo) {
		logger.info("실행");
		JSONObject json = new JSONObject();
		if (authentication != null) {
			// 로그인한 유저 정보의 넘버로 데이터 얻기
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();

			// 주문목록 전체 갯수
			int totalRows = orderService.getOrderListCount(mno);
			Pager pager = new Pager(5, 5, totalRows, pageNo);

			json.put("result", orderService.getOrderListByPage(mno, pager));
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

	@PostMapping(value = "/newOrder", produces = "Application/json; charset=UTF-8;")
	public String newOrder(ProductOrder order, String plist, Model model) {
		int mno = 1;
		int mpoint = 500;
		order.setMno(mno);
		OrderResult result = orderService.newOrder(order, plist, mpoint);

		if (result.equals(OrderResult.SUCCESS)) {
			return "redirect:/orderdetail?code=" + order.getPorderno();
		} else if (result.equals(OrderResult.ENOUGH_MPOINT)) {
			model.addAttribute("errorTitle", "사용 가능한 마일리지가 부족합니다.");
			model.addAttribute("errorContent", "정상적인 방식으로 마일리지를 적용해주세요.");
			return "error/custom";
		} else if (result.equals(OrderResult.NOT_VALID)) {
			model.addAttribute("errorTitle", "잘못된 상품 결제입니다.");
			model.addAttribute("errorContent", "정상적인 방식으로 결제를 진행해주세요.");
			return "error/custom";
		} else {
			model.addAttribute("errorTitle", "알 수 없는 서버 오류입니다.");
			model.addAttribute("errorContent", "잠시후 다시 실행해주세요.");
			return "error/custom";
		}

	}

}
