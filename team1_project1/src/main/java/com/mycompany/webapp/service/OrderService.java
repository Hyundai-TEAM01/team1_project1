package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderDAO;
import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;

@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);

	@Resource
	private OrderDAO orderDao;

	public List<OrderList> getOrderList(int mNo) {
		// 유저 넘버로 주문 목록 가져오기
		int sampleMno = 1;
		return orderDao.getOrderList(sampleMno);
	}

	public List<OrderDetail> getOrderDetail(int mNo, int pOrderNo) {
		// 유저 넘버와 그에 맞는 주문번호로 상품주문상세정보 가져오기
		int samplemNo = 1;
		int samplepOrderNo = 1;
		return orderDao.getOrderDetail(samplemNo, samplepOrderNo);
	}

}
