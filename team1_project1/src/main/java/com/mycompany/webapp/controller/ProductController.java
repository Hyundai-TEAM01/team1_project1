package com.mycompany.webapp.controller;

import javax.annotation.Resource;

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
	
	@RequestMapping("/{pcodePcolor}")
	public String text(@PathVariable("pcodePcolor") final String pcodePcolor, @RequestParam("ccode") String ccode, Model model){
		logger.info("실행");
		logger.info("pccode : " + pcodePcolor + " ccode : " + ccode);
		String[] tempPccode = pcodePcolor.split("_");
		String pcode = tempPccode[0];
		String nowColor = tempPccode[1];
		
		ProductDetail productDetail = productListService.getProductDetail(pcode);
		model.addAttribute("product", productDetail);
		model.addAttribute("nowColor", nowColor);
		
		return "product";
	}
	
	/*@GetMapping(value = "/{pccode}", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String text(@PathVariable("pccode") final String pccode,  
			@RequestParam(value = "ccode", defaultValue="MEN_TOP_SHIRTS") String ccode) throws Exception {
		logger.info("실행");
		logger.info("pccode : " + pccode + " ccode : " + ccode);
		
		return "product";
	}*/
}
