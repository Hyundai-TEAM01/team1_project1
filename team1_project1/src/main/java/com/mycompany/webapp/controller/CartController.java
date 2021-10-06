package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartDetail;
import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.dto.ProductOrder;
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
	public String order(@RequestParam String pList, Model model) {
		
		// mno 가져와서 유효성 확인 추가 하기!!
		String[] productList = pList.split(",");
		model.addAttribute("pList", productList);
		return "order";
	}
	
	
	@GetMapping(value =  "/getCartProductInfoList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getCartProductInfoList() {
		JSONObject json = new JSONObject();
		
		List<CartProductInfo> li = cartService.getCartProductList(0);
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
	
	@GetMapping(value =  "/getOrderList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getOrderList(String productList) {
		logger.info("run");
		JSONObject json = new JSONObject();

		String[] pList = productList.split(",");
		List<CartProductInfo> li = cartService.getCartDetailList(pList);
		json.append("infoList", li);
		
		return json.toString();
	}
	
	
	
	
	@PostMapping(value = "/cartDetailDelete", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String cartDetailDelete(@RequestBody HashMap<String, Integer> map) {
		JSONObject json = new JSONObject();
		json.put("result", cartService.deleteCartDetail(map.get("cdno")));
		
		return json.toString();
	}
	
	@PostMapping(value = "/cartDetailListDelete", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String cartDetailList(@RequestBody HashMap<String,String[]> pList) {
		JSONObject json = new JSONObject();
		json.put("result", cartService.deleteCartDetailList(pList.get("pList")));
		
		return json.toString();
	}
	
}
