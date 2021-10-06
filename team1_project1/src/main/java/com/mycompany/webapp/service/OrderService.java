package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.OrderDAO;
import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;
import com.mycompany.webapp.dto.ProductOrder;

@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	public enum OrderResult{
		SUCCESS, ENOUGH_MPOINT, NOT_VALID, FAIL
	}

	@Resource
	private OrderDAO orderDao;
	
	@Resource
	private CartDAO cartDao;
	

	public List<OrderList> getOrderList(int mno) {
		// 유저 넘버로 주문 목록 가져오기
		// int sampleMno = 1;
		return orderDao.getOrderList(mno);
	}

	public List<OrderDetail> getOrderDetail(int mno, int porderno) {
		// 유저 넘버와 그에 맞는 주문번호로 상품주문상세정보 가져오기
		// int samplemNo = 1;
		// int samplepOrderNo = 1;
		return orderDao.getOrderDetail(mno, porderno);
	}
	
	@Transactional
	public OrderResult newOrder(ProductOrder po,String plist, int mpoint) {
		int mno = po.getMno();
		
		// cartno 가져오기!
		int cartno = 1;
		
		// 마일리지 부족 시
		if(mpoint < po.getPorderdiscount()) {
			return OrderResult.ENOUGH_MPOINT;
		}
		
		
		// 해당 member의 cart에 담겨 있는 제품인지 확인
		String[] productlist = plist.split(",");
		List<CartProductInfo> pInfoList = cartDao.getCartProductListByArray(productlist, cartno);
		
		if(pInfoList.size() != productlist.length) { // cart에 없는 물건을 구매하고자 하는 경우
			return OrderResult.NOT_VALID;
		}
		
		int sum = 0;
		for(CartProductInfo p : pInfoList) {
			sum += p.getAmount()*p.getPprice();
		}
		
		po.setPordertotalorgprice(sum); // 구매 상품들의 가격 합 추가
		
		po.setPorderpayprice(sum - po.getPorderdiscount());
		orderDao.createOrder(po);
		int result = po.getPorderno();
		if( result > 0) {
			
			// 사용자 마일리지 차감
			logger.info("가져온 key 값 : " + result);
			
			
			// cart에서 주문한 값들 다 delete로 변경
			
			
			// order detail 생성
			
			
			return OrderResult.SUCCESS;
		}
		return OrderResult.FAIL;
	}
	
	


}
