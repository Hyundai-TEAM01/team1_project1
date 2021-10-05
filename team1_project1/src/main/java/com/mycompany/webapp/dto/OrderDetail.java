package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
	private int pOrderNo;
	private Date pOrderDate;
	private String pCode;
	private String pColor;
	private String pSize;
	private int pOrderPrice;
	private int pOrderaAmount;
	private int pOrderTotalPoint;
	private String pOrderPhone;
	private String pOrderAddr1;
	private String pOrderAddr2;
	private String pOrderAddr3;
	private String pOrderTel;
	private String pOrderRequest;
	private int pOrderTotalorgPrice;
	private int pOrderDiscount;
	private int pOrderPayPrice;
	private String pOrderStatus;
	private Date pOrderDoneDate;
	private String pOrderPayName;
	private String pOrderPayNo;
}
