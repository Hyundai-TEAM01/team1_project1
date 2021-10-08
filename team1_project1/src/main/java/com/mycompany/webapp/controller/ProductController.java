package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mycompany.webapp.dto.ProductDetail;
import com.mycompany.webapp.service.ProductListService;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private ProductListService productListService;
	
	@RequestMapping("/{pcode}")
	public String getProduct(@PathVariable("pcode") final String pcode, @RequestParam("pcolor") String pcolor, @RequestParam("ccode") String ccode, Model model){
		logger.info("실행");
		logger.info("pccode : " + pcode + " ccode : " + ccode);
		
		ProductDetail productDetail = productListService.getProductDetail(pcode);
		model.addAttribute("product", productDetail);
		model.addAttribute("pcolor", pcolor);
		
		return "product";
	}
	
	@GetMapping(value = "/getSizeAmount", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getSizeAmount(@RequestParam("pcode") String pcode, @RequestParam("pcolor") String pcolor) {
		logger.info("실행");
		logger.info("pcode : " + pcode + " pcolor : " + pcolor);
		
		JSONObject jsonObject = new JSONObject();
		
		return jsonObject.toString();
	}
}
