package com.mycompany.webapp.controller;

import java.time.LocalDateTime;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dao.TestDao;
import com.mycompany.webapp.dto.MemberDetails;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.CouponService.CouponEventResult;

@Controller
@RequestMapping("/eventtest2")
public class TestRedisEventController {
	private static final Logger logger = LoggerFactory.getLogger(EventCouponController.class);

	// ExecutorService 객체 생성
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	@Resource
	private RedisTemplate<String, String> template;

	private static final LocalDateTime EVENT_TIME = LocalDateTime.of(2021, 10, 10, 19, 10, 00);

	// 10명이 넘어가면 true로 바꿈
	private static boolean isLeft = true;
	
	@Resource
	TestDao dao;

	private static int CNT = 0;

	@RequestMapping(value = "/getcouponevent", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getCouponEvent(int mno, String couponName) throws Exception {
		JSONObject jsonObject = new JSONObject();
		if (!LocalDateTime.now().isEqual(EVENT_TIME) && !LocalDateTime.now().isAfter(EVENT_TIME)) {
			jsonObject.put("result", "notstart");
			return jsonObject.toString();
		}

		Callable<Integer> task = new Callable<Integer>() {

			@Override
			public Integer call() throws Exception {

				logger.info(Thread.currentThread().getName() + " : 이벤트 처리");
//				if(isLeft) {
//					template.boundZSetOps(couponName).add(String.valueOf(mno), System.nanoTime());
//					template.boundValueOps("success_"+mno).set(String.valueOf(CNT++));
//					if(!template.boundZSetOps(couponName).range(0, 8).contains(String.valueOf(mno))) {
//						isLeft = false;
//						return 0;
//					}
//					return 1;
//				}else {
//					template.boundZSetOps(couponName).add(String.valueOf(mno), System.nanoTime());
//					return 0;
//				}
				if (isLeft) {
					int amount = Integer.parseInt(template.boundValueOps(couponName).get());
					if (amount < 10) {
						template.boundValueOps(couponName).set(String.valueOf(amount+1));
						dao.insertCoupon(mno, couponName);
					}else {
						isLeft = false;
						return 0;
					}
					return 1;
				} else {
					return 0;
				}
			}
		};

		Future<Integer> future = executorService.submit(task);
		logger.info(Thread.currentThread().getName() + ": 큐에 작업을 저장");

//		int result = 0;
//		if(isLeft) {
//			template.boundZSetOps(couponName).add(String.valueOf(mno), System.nanoTime());
//			CNT++;
//			logger.info("실행 : " + CNT);
//			if(!template.boundZSetOps(couponName).range(0, 9).contains(String.valueOf(mno)))
//				isLeft = false;
//		}else {
//			template.boundZSetOps(couponName).add(String.valueOf(mno), System.nanoTime());
//			result = 0;
//		}
//		

		// 이벤트 처리가 완료될 때까지 대기
		int result = future.get();
		if (result == 0) {
			jsonObject.put("result", "fail");
		} else if (result == 1) {
			jsonObject.put("result", "success");
		}

		return jsonObject.toString();
	}
}
