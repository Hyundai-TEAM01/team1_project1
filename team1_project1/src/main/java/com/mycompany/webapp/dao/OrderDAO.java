package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;
import com.mycompany.webapp.dto.OrderListQuery;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductOrder;

@Mapper
public interface OrderDAO {
	// 주문 목록 가져오기(유저번호 + 페이징 + 검색쿼리[상품명, 주문번호])
	public List<OrderList> getOrderListByPage(@Param("mno") int mno, @Param("pager") Pager pager,
			@Param("query") OrderListQuery query);

	// 주문 목록 갯수 가져오기(유저번호 + 페이징 + 검색쿼리[상품명, 주문번호])
	public int getOrderListCount(@Param("mno") int mno, @Param("query") OrderListQuery query);

	// 주문 상세내용 가져오기(유저번호, 주문번호)
	public List<OrderDetail> getOrderDetail(int mno, int porderno);

	public int createOrder(ProductOrder po);
}
