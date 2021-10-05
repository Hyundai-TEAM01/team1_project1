package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {
	private int pOrderNo;
	private Date pOrderDate;
	private String pCode;
	private String pColor;
	private String pSize;
	private int pOrderPrice;
	private int pOrderAmount;
}
