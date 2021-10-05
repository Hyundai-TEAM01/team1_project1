package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;

@Mapper
public interface OrderDAO {
	public List<OrderList> getOrderList(int mNo);

	public List<OrderDetail> getOrderDetailList(int mNo, int pOrderNo);
}
