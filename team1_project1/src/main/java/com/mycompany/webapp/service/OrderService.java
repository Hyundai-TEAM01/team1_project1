package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.OrderDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dto.CartProductInfo;
import com.mycompany.webapp.dto.OrderDetail;
import com.mycompany.webapp.dto.OrderList;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.dto.ProductOrderDetail;

@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);

	public enum OrderResult {
		SUCCESS, ENOUGH_MPOINT, NOT_VALID, FAIL
	}

	@Resource
	private OrderDAO orderDao;
	
	@Resource
	private MemberDAO memberDao;

	@Resource
	private CartDAO cartDao;
	
	@Resource
	private ProductDAO productDao;

	// 유저 넘버로 주문 목록 가져오기(페이징)
	public List<OrderList> getOrderListByPage(int mno, Pager pager) {
		// int sampleMno = 1;
		return orderDao.getOrderListByPage(mno, pager);
	}

	// 유저 넘버로 주문 목록의 갯수 가져오기
	public int getOrderListCount(int mno) {
		return orderDao.getOrderListCount(mno);
	}

	// 유저 넘버와 그에 맞는 주문번호로 상품주문상세정보 가져오기
	public List<OrderDetail> getOrderDetail(int mno, int porderno) {
		return orderDao.getOrderDetail(mno, porderno);
	}

	@Transactional
	public OrderResult newOrder(ProductOrder productOrder, String plist, int mpoint) {
		int mno = productOrder.getMno();
		int cartno = cartDao.getCartNoByMno(mno);

		// 마일리지가 부족한 경우
		if (mpoint < productOrder.getPorderdiscount()) {
			return OrderResult.ENOUGH_MPOINT;
		}

		// 해당 member의 cart에 담겨 있는 제품인지 확인
		String[] productlist = plist.split(",");
		List<CartProductInfo> pInfoList = cartDao.getCartProductListByArray(productlist, cartno);

		if (pInfoList.size() != productlist.length) { // cart에 없는 물건을 구매하고자 하는 경우
			return OrderResult.NOT_VALID;
		}

		int sum = 0;
		for (CartProductInfo p : pInfoList) {
			sum += p.getAmount() * p.getPprice();
		}

		productOrder.setPordertotalorgprice(sum); // 구매 상품들의 가격 합 추가

		productOrder.setPorderpayprice(sum - productOrder.getPorderdiscount());
		
		productOrder.setPordertotalpoint((int)Math.ceil(productOrder.getPorderpayprice()*0.05));
		
		orderDao.createOrder(productOrder); // productOrder db에 추가
		
		int result = productOrder.getPorderno(); // 새롭게 생성된 sequence 값
		if (result > 0) {

			// 사용자 마일리지 차감
			if(productOrder.getPorderdiscount() != 0)
				memberDao.updateMemberMpoint(mno,mpoint - productOrder.getPorderdiscount());
			
			// cart에서 주문한 row isdelete 변경
			cartDao.purchaseCartDetailList(productlist);
			
			// order detail 생성
			List<ProductOrderDetail> porderDetailList = new ArrayList<>();
			for(CartProductInfo info : pInfoList) {
				ProductOrderDetail pod = new ProductOrderDetail();
				pod.setPcode(info.getPcode());
				pod.setPcolor(info.getPcolor());
				pod.setPodamount(info.getAmount());
				pod.setPodprice(info.getPprice() * info.getAmount());
				pod.setPorderno(result);
				pod.setPsize(info.getPsize());
				pod.setPodstatus("결제완료");
				porderDetailList.add(pod);
			}
			
			logger.info("카트 디테일 생성 전");
			orderDao.createOrderDetailByList(porderDetailList);
			
			// 상품 재고 감소 시키기!
			
			for(ProductOrderDetail pod : porderDetailList) {
				int amount = productDao.getProductAmount(pod.getPcode(), pod.getPsize(), pod.getPcolor());
				amount -= pod.getPodamount();
				productDao.updateProductStock(pod.getPcode(), pod.getPsize(), pod.getPcolor(), amount);
			}
			
			return OrderResult.SUCCESS;
		}
		return OrderResult.FAIL;
	}

}
