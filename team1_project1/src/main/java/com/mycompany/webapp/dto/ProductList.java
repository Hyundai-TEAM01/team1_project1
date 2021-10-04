package com.mycompany.webapp.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductList {
	private String ccode;
	private String pcode;
	private String pname;
	private String pbrand;
	private int pprice;
	private Date pdate;
	// productimg와 productstock 추가해야함
}
