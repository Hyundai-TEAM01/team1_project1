package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CouponDAO;
import com.mycompany.webapp.dto.CouponList;
import com.mycompany.webapp.dto.CouponListQuery;
import com.mycompany.webapp.dto.Pager;

@Service
public class CouponService {
	private static final Logger logger = LoggerFactory.getLogger(CouponService.class);

	@Resource
	private CouponDAO couponDAO;

	// 쿠폰 목록 갯수 가져오기(유저번호 + 페이징 + 검색쿼리[미사용, 사용완료, 기간만료])
	public List<CouponList> getCouponListByPage(int mno, Pager pager, CouponListQuery query) {
		// int sampleMno = 1;
		return couponDAO.getCouponListByPage(mno, pager, query);
	}

	// 쿠폰 목록 갯수 가져오기(유저번호 + 페이징 + 검색쿼리[미사용, 사용완료, 기간만료])
	public int getCouponListCount(int mno, CouponListQuery query) {
		return couponDAO.getCouponListCount(mno, query);
	}
}
