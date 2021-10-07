package com.mycompany.webapp.controller;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.MemberDetails;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		logger.info("실행");
		return "member/loginForm";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		logger.info("실행");
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/memberdata", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String memberData(Authentication authentication) {
		JSONObject json = new JSONObject();
		if(authentication == null) {
			json.put("cartcnt",0);
		}else {
			json.put("cartcnt", ((MemberDetails)authentication.getPrincipal()).getCartCnt());
		}
		
		return json.toString();
	}
}  
