package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dto.CartDetail;
import com.mycompany.webapp.dto.CartProductInfo;

@Service
public class CartService {
	private static final Logger logger = LoggerFactory.getLogger(CartService.class);
	
	public enum CartUpdateResult{
		SUCCESS, FAIL, NOT_VALID
	}
	
	@Resource
	private CartDAO cartDao;
	
	@Resource
	private MemberDAO memberDao;
	
	@Resource
	private ProductDAO productDao;
	
	public List<CartProductInfo> getCartProductList(int mno){
		int cartNo = cartDao.getCartNoByMno(mno);
		return cartDao.getCartProductList(cartNo);
	}
	
	public int deleteCartDetail(int cartdetailno) {
		return cartDao.removeCartDetail(cartdetailno);
	}
	
	public int deleteCartDetailList(String[] cdnoList) {
		return cartDao.removeCartDetailList(cdnoList);
	}
	
	public CartUpdateResult updateCartDetail(int mno, int cartdetailno, CartDetail cartDetail) {
		if (checkInCart(mno, cartdetailno)) {
			int result = cartDao.updateCartdetail(cartDetail);
			
			if(result == 1) {
				return CartUpdateResult.SUCCESS;
			}else {
				return CartUpdateResult.FAIL;				
			}
			
		}else {
			return CartUpdateResult.NOT_VALID;
		}
	}
	
	
	public List<CartProductInfo> getCartDetailList(String[] pList){
		logger.info("service run");
		return cartDao.getCartProductListByArray(pList, -1);
	}
	
	public boolean checkInCart(int mno, int cartdetailno) {
		int cartNo = cartDao.getCartNoByMno(mno);
		
		if(cartDao.getCartDetailByCartdetailno(cartdetailno, cartNo) != null) {
			return true;
		}
		
		return false;
	}
	
	public int getStockAmount(String pcode, String psize, String pcolor) {
		return productDao.getProductAmount(pcode, psize, pcolor);
	}
	
}
