package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductList;

@Mapper
public interface ProductListDAO {
	public List<ProductList> getProductList(String ccode);
}
