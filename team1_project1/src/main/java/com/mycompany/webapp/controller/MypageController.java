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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mycompany.webapp.dto.CouponListQuery;
import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.dto.OrderListQuery;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderService.OrderResult;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Resource
	OrderService orderService;

	/* 주문목록페이지 */
	@RequestMapping("/orderlist")
	public String orderList() {

		return "orderList";
	}

	// 주문목록페이지 - 목록리스트 페이징 적용(JSON)
	@GetMapping(value = "/getorderlist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderListByPage(Authentication authentication, OrderListQuery query) {
		logger.info("실행");
		JSONObject json = new JSONObject();
		if (authentication != null) {
			logger.info(query.toString());
			// 로그인한 유저 정보의 넘버로 데이터 얻기
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();

			// 주문목록 전체 갯수
			int totalRows = orderService.getOrderListCount(mno, query);
			// (한번에 보여지는 게시물 수, 한번에 보여지는 페이징 번호 수, 페이지)
			Pager pager = new Pager(3, 5, totalRows, query.getPageNo());
			logger.info(pager.toString());

			String pagerInString = new Gson().toJson(pager);
			JSONObject pagerObject = new JSONObject(pagerInString);

			// 주문 목록(로그인한 사람번호, 페이저, 검색쿼리)
			json.put("result", orderService.getOrderListByPage(mno, pager, query));
			json.put("pagination", pagerObject);
		} else {
			json.put("result", "fail");
		}
		return json.toString();
	}

	/* 주문상세페이지 */
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

	@Resource
	CouponService couponService;

	/* 쿠폰목록페이지 */
	@RequestMapping("/couponlist")
	public String couponList() {
		return "couponList";
	}

	// 쿠폰목록페이지 - 목록리스트 페이징 적용(JSON)
	@GetMapping(value = "/getcouponlist", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getCouponListByPage(Authentication authentication, CouponListQuery query) {
		logger.info("실행");
		JSONObject json = new JSONObject();
		if (authentication != null) {
			logger.info(query.toString());
			// 로그인한 유저 정보의 넘버로 데이터 얻기
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();

			// 주문목록 전체 갯수
			int totalRows = couponService.getCouponListCount(mno, query);
			// (한번에 보여지는 게시물 수, 한번에 보여지는 페이징 번호 수, 페이지)
			Pager pager = new Pager(5, 5, totalRows, query.getPageNo());
			logger.info(pager.toString());

			String pagerInString = new Gson().toJson(pager);
			JSONObject pagerObject = new JSONObject(pagerInString);

			// 쿠폰 목록(로그인한 사람번호, 페이저, 검색쿼리)
			json.put("result", couponService.getCouponListByPage(mno, pager, query));
			json.put("pagination", pagerObject);
		} else {
			json.put("result", "fail");
		}
		return json.toString();
	}

	@PostMapping(value = "/newOrder", produces = "Application/json; charset=UTF-8;")
	public String newOrder(ProductOrder order, String plist, Model model, Authentication authentication) {
		MemberDetails minfo = (MemberDetails) authentication.getPrincipal();

		order.setMno(minfo.getMno());
		OrderResult result = orderService.newOrder(order, plist, minfo.getMpoint());

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
