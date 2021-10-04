package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Resource
	private CartService cartService;
	
	@RequestMapping("/content")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping("/order")
	public String order() {
		return "order";
	}
	
	
	@GetMapping(value =  "/getCartProductInfoList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getCartProductInfoList() {
		JSONObject json = new JSONObject();
		
		List<CartProductInfo> li = cartService.getCartDetailList(0);
		json.append("infoList", li);
		
		JSONArray jsonArr = new JSONArray();
		
		for(CartProductInfo cinfo : li) {
			JSONObject temp = new JSONObject();
			
			// getStockAmount(cinfo.getPcode(),cinfo.getPcolor(),cinfo.getPsize()) 생성하기
			temp.append(String.valueOf(cinfo.getCartdetailno()), "5"); 
			jsonArr.put(temp);
		}
		
		
		json.append("stockList", jsonArr);
		return json.toString();
	}
}
