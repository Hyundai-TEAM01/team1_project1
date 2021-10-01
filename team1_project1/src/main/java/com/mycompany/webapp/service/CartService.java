package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dto.CartDetail;
import com.mycompany.webapp.dto.CartProductInfo;

@Service
public class CartService {
	private static final Logger logger = LoggerFactory.getLogger(CartService.class);
	
	@Resource
	private CartDAO cartDao;
	
	public List<CartProductInfo> getCartDetailList(int mno){
		int cartNo = 1; // mno로 cartno 가져오기
		
		
		return cartDao.getCartProductList(cartNo);
	}
}
