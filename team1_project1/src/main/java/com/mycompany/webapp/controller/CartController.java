package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartDetail;
import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.CartService.CartUpdateResult;

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
	public String order(@RequestParam String pList, Model model, Authentication authentication) {
		MemberDetails minfo = (MemberDetails)authentication.getPrincipal();
		// mno 가져와서 유효성 확인 추가 하기!!
		String[] productList = pList.split(",");
		model.addAttribute("pList", productList);
		model.addAttribute("mphone", minfo.getMphone());
		model.addAttribute("memail", minfo.getMemail());
		model.addAttribute("mname", minfo.getMname());
		model.addAttribute("mpoint", minfo.getMpoint());
		
		return "order";
	}

	@GetMapping(value = "/getCartProductInfoList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getCartProductInfoList(Authentication authentication) {

		MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();

		JSONObject json = new JSONObject();

		List<CartProductInfo> li = cartService.getCartProductList(memberDetails.getMno());
		json.append("infoList", li);

		JSONArray jsonArr = new JSONArray();

		for (CartProductInfo cinfo : li) {
			JSONObject temp = new JSONObject();

			// getStockAmount(cinfo.getPcode(),cinfo.getPcolor(),cinfo.getPsize()) 생성하기
			temp.append(String.valueOf(cinfo.getCartdetailno()), 
					cartService.getStockAmount(cinfo.getPcode(), cinfo.getPsize(), cinfo.getPcolor()));
			jsonArr.put(temp);
		}

		json.append("stockList", jsonArr);
		return json.toString();
	}

	@GetMapping(value = "/getOrderList", produces = "Application/json; charset=UTF-8;")
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
	public String cartDetailList(@RequestBody HashMap<String, String[]> pList) {
		JSONObject json = new JSONObject();
		json.put("result", cartService.deleteCartDetailList(pList.get("pList")));

		return json.toString();
	}
	
	
	@PatchMapping(value = "/cartDetailUpdate", produces = "Application/json; charset=UTF-8")
	@ResponseBody
	public String cartDetailUpdate(@RequestBody HashMap<String, Integer> info, Authentication authentication) {
		JSONObject json = new JSONObject();

		CartDetail cartDetail = new CartDetail();
		cartDetail.setAmount(info.get("amount"));
		cartDetail.setCartDetailNo(info.get("cartDetailNo"));
		
		int mno = ((MemberDetails) authentication.getPrincipal()).getMno();
		CartUpdateResult result = cartService.updateCartDetail(mno, info.get("cartDetailNo"), cartDetail);
		
		if(result.equals(CartUpdateResult.SUCCESS)) {
			json.put("result", "성공");
		}else if(result.equals(CartUpdateResult.NOT_VALID)) {			
			json.put("result", "잘못된 상품 수정 오류");
		}
		else {
			json.put("result", "알 수 없는 오류로 실패");
		}

		
		return json.toString();
	}

}
