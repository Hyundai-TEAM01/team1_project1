package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductListDAO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductList;

@Service
public class ProductListService {
	private static final Logger logger = LoggerFactory.getLogger(ProductListService.class);
	
	@Resource
	private ProductListDAO productListDAO;
	
	public List<ProductList> getProductList(Pager pager){
		return productListDAO.selectByCategoryPage(pager);
	}
	public int getTotalProducListtNum(String ccode) {
		return productListDAO.productListCount(ccode);
	}
}
