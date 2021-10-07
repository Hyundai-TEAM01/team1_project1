package com.mycompany.webapp.dto;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MemberDetails extends User {
	// Spring Security User 상속받아 로그인한 유저정보에 추가로 원하는 데이터를 넣음
	private static final long serialVersionUID = 1L;
	private int mno;
	private String mphone;
	private String memail;
	private int mpoint;
	private String mname;
	private int cartCnt;
	
	public MemberDetails(String mid, String mpassword, boolean menabled, List<GrantedAuthority> mAuthorities, int mno,
			String mphone, String memail, int mpoint, String mname, int cartCnt) {
		super(mid, mpassword, menabled, true, true, true, mAuthorities);
		this.mno = mno;
		this.mphone = mphone;
		this.memail = memail;
		this.mpoint = mpoint;
		this.mname = mname;
		this.cartCnt = cartCnt;
	}

	public int getMno() {
		return mno;
	}
	public int getCartCnt() {
		return cartCnt;
	}

	public int getMpoint() {
		return mpoint;
	}

	public String getMemail() {
		return memail;
	}

	public String getMphone() {
		return mphone;
	}
	public String getMname() {
		return mname;
	}
}
