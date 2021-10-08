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

import com.google.gson.Gson;
import com.mycompany.webapp.dto.CouponListQuery;
import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.CouponService;

@Controller
public class EventCouponController {
	private static final Logger logger = LoggerFactory.getLogger(EventCouponController.class);

	// 이벤트쿠폰페이지
	@RequestMapping("/event")
	public String event() {
		return "event";
	}

	@Resource
	CouponService couponService;

	// 쿠폰목록페이지
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
}
