package com.mycompany.webapp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CartDetail;
import com.mycompany.webapp.dto.CartProductInfo;

@Mapper
public interface CartDAO {
	public List<CartDetail> getCartDetailList(int cartNo);

	public List<CartProductInfo> getCartProductList(int cartNo);

	public int removeCartDetail(int cartDetailNo);

	public int removeCartDetailList(String[] cartDetailNoList);

	public int insertCartDetail(CartDetail cartDetail);

	public CartDetail selectByCartDetailNo(int cartDetailNo);

	public List<CartProductInfo> getCartProductListByArray(String[] pList, int cartno);
}
