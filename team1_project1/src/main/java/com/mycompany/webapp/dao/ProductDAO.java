package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductImg;
import com.mycompany.webapp.dto.ProductList;

@Mapper
public interface ProductDAO {
	public List<ProductList> selectByCategoryPage(@Param("ccode") String ccode, @Param("pager") Pager pager);
	public List<ProductImg> selectByProductImg(String pcode);

	public int productListCount(String ccode);
	
}
