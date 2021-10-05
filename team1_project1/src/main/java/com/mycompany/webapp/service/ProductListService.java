package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductListDAO;
import com.mycompany.webapp.dto.ProductList;

@Service
public class ProductListService {
	private static final Logger logger = LoggerFactory.getLogger(ProductListService.class);
	
	@Resource
	private ProductListDAO productListDAO;
	
	public List<ProductList> getProductList(String ccode){
		String tempCcode = "MEN_TOP_SHIRTS";
		
		return productListDAO.getProductList(tempCcode);
	}
}
