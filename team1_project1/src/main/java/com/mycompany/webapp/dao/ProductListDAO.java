package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductImg;
import com.mycompany.webapp.dto.ProductList;

@Mapper
public interface ProductListDAO {
	public List<ProductList> selectByCategoryPage(Pager pager);
	public int productListCount(String ccode);
}
