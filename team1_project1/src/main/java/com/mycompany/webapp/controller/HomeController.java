package com.mycompany.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductList;
import com.mycompany.webapp.service.ProductListService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource
	private ProductListService productListService;

	@RequestMapping("/")
	public String content(Authentication authentication) {
		logger.info("실행");

		if (authentication == null) {
			logger.info("로그인한 사용자 정보 없음!!!");
		} else {
			MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
			int mno = memberDetails.getMno();
			logger.info("로그인한 사용자 정보 : " + mno);
		}

		return "home";
	}

//	@RequestMapping("/")
//	public String content(@AuthenticationPrincipal MemberDetails memberDetails) {
//		logger.info("실행");
//
//		logger.info("로그인한 사용자 정보 : " + memberDetails.getMno());
//		return "home";
//	}

	@GetMapping(value = "/getProductList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getProductList(@RequestParam(name = "pageNo", defaultValue="1") int pageNo, @RequestParam(name = "ccode", defaultValue="MEN_TOP_SHIRTS") String ccode) throws JsonProcessingException {
		JSONObject json = new JSONObject();

		int totalRows = productListService.getTotalProducListtNum(ccode);
		logger.info("totalRows : " + Integer.toString(totalRows));
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		pager.setCcode(ccode);
		logger.info("ProductList param : " + pager.getTotalPageNo() + " " + pager.getEndPageNo());
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.convertValue(pager, Map.class);
		
		List<ProductList> productList = productListService.getProductList(pager);
		
		json.put("pager", map);
		json.put("productList", productList);

		return json.toString();
	}

	@RequestMapping("/error/403")
	public String error403() {
		logger.info("실행");
		return "error/403";
	}
}