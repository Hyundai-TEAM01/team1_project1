package com.mycompany.webapp.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductList;
import com.mycompany.webapp.service.ProductListService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private ProductListService productListService;
	
	
	@RequestMapping("/")
	public String content() {
		logger.info("실행");
		return "home";
	}
	
	@GetMapping(value = "/getProductList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getProductList(@RequestParam(defaultValue="1") int pageNo, String ccode, Model model) {
		String tempCcode = "MEN_TOP_SHIRTS";
		JSONObject json = new JSONObject();

		int totalRows = productListService.getTotalProducListtNum(tempCcode);
		
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		pager.setCcode(tempCcode);
		model.addAttribute("pager", pager);
		
		HashMap<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("groupNo", pager.getGroupNo());
		pagerMap.put("startPageNo", pager.getStartPageNo());
		pagerMap.put("endPageNo", pager.getEndPageNo());
		pagerMap.put("pageNo", pager.getPageNo());
		pagerMap.put("groupNo", pager.getGroupNo());
		pagerMap.put("totalGroupNo", pager.getTotalGroupNo());
		pagerMap.put("totalPageNo", pager.getTotalPageNo());
//		JSONArray pagerJson = new JSONArray(pager);
		
		List<ProductList> productList = productListService.getProductList(pager);
		
		json.append("pager", pagerMap);
		json.append("productList", productList);
		
		return json.toString();
	}
	
	@RequestMapping("/error/403")
	public String error403() {
		logger.info("실행");
		return "error/403";
	}
}  