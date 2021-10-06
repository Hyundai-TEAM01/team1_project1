package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;
import com.mycompany.webapp.dto.ProductOrder;

@Mapper
public interface OrderDAO {
	public List<OrderList> getOrderList(int mNo);

	public List<OrderDetail> getOrderDetail(int mNo, int pOrderNo);
	
	public int createOrder(ProductOrder po);
}
