package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mycompany.webapp.dto.CartProductDetail;
import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.dto.MemberDetails;
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

		String[] productList = pList.split(",");
		model.addAttribute("pList", productList);
		model.addAttribute("mphone", minfo.getMphone());
		model.addAttribute("memail", minfo.getMemail());
		model.addAttribute("mname", minfo.getMname());
		int mpoint = cartService.getMemberMpoint(minfo.getUsername());
		model.addAttribute("mpoint", mpoint);
		return "order";
	}

	@GetMapping(value = "/getCartProductInfoList", produces = "Application/json; charset=UTF-8;")
	@ResponseBody
	public String getCartProductInfoList(Authentication authentication) {

		MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();

		JSONObject json = new JSONObject();
		Map<String,List> map = cartService.getCartProductList(memberDetails.getMno());
		List<CartProductInfo> li = map.get("cartProductInfoList");
		json.append("infoList", li);

		JSONArray jsonArr = new JSONArray();
		JSONArray jsonArr2 = new JSONArray();

		for (CartProductInfo cinfo : li) {
			JSONObject temp = new JSONObject();
			JSONObject temp2 = new JSONObject();

			// getStockAmount(cinfo.getPcode(),cinfo.getPcolor(),cinfo.getPsize()) ????????????
			temp.append(String.valueOf(cinfo.getCartdetailno()), 
					cartService.getStockAmount(cinfo.getPcode(), cinfo.getPsize(), cinfo.getPcolor()));
			
			temp2.put(cinfo.getPcode(), (List<CartProductDetail>)map.get(cinfo.getPcode()));
			
			jsonArr.put(temp);
			jsonArr2.put(temp2);
		}

		json.append("stockList", jsonArr);
		json.append("detailList", jsonArr2);
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
			json.put("result", "??????");
		}else if(result.equals(CartUpdateResult.NOT_VALID)) {			
			json.put("result", "????????? ?????? ?????? ??????");
		}
		else {
			json.put("result", "??? ??? ?????? ????????? ??????");
		}

		
		return json.toString();
	}
	
	@PatchMapping(value = "/cartDetailOptionUpdate", produces = "Application/json; charset=UTF-8")
	@ResponseBody
	public String cartDetailOptionUpdate(@RequestBody HashMap<String, String> info, Authentication authentication) {
		JSONObject json = new JSONObject();
		
		CartDetail cartDetail = new CartDetail();
		cartDetail.setAmount(1);
		cartDetail.setCartDetailNo(Integer.parseInt(info.get("cartDetailNo")));
		cartDetail.setPcolor(info.get("pcolor"));
		cartDetail.setPsize(info.get("psize"));
		
		logger.info(cartDetail.toString());
		
		int mno = ((MemberDetails) authentication.getPrincipal()).getMno();
		CartUpdateResult result = cartService.updateCartDetailOption(mno, cartDetail.getCartDetailNo(), cartDetail);
		
		if(result.equals(CartUpdateResult.SUCCESS)) {
			json.put("result", "??????");
		}else if(result.equals(CartUpdateResult.NOT_VALID)) {			
			json.put("result", "????????? ?????? ?????? ??????");
		}else if(result.equals(CartUpdateResult.DUPLICATED)) {
			json.put("result", "duplicated");
		}
		else {
			json.put("result", "??? ??? ?????? ????????? ??????");
		}
		
		
		return json.toString();
	}

}
